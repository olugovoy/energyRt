read.scenario <- function(scen, ...) {
  ## arguments
  # scen
  # readOutputFunction = read.csv (may use data.table::fread)
  # tmp.dir dir from wich read results, by default in scen@misc$tmp.dir 
  # echo = TRUE - print working data
  arg <- list(...)
  
  read_result_time <- proc.time()[3]
  if (is.null(arg$echo)) arg$echo <- TRUE
  if (is.null(arg$readOutputFunction)) arg$readOutputFunction <- read.csv
  if (is.null(arg$tmp.dir)) {
    arg$tmp.dir <- scen@misc$tmp.dir 
    if (is.null(arg$tmp.dir))
      stop('Directory "tmp.dir" not specified')
  }
 # Read basic variable list (vrb_list) and additional if user need (vrb_list2)
  vrb_list <- arg$readOutputFunction(paste(arg$tmp.dir, '/output/variable_list.csv', sep = ''), stringsAsFactors = FALSE)$value
  if (file.exists(paste(arg$tmp.dir, '/output/variable_list2.csv', sep = ''))) {
    vrb_list2 <- arg$readOutputFunction(paste(arg$tmp.dir, '/output/variable_list2.csv', sep = ''), stringsAsFactors = FALSE)$value
  } else vrb_list2 <- character()
  rr <- list(variables = list(), 
             set = arg$readOutputFunction(paste(arg$tmp.dir, '/output/raw_data_set.csv', sep = ''), stringsAsFactors = FALSE))
  # Read set and alias
  ss <- list()
  for (k in unique(rr$set$set)) {
    ss[[k]] <- rr$set$value[rr$set$set == k]
  }
  # add alias
  ss$src <- ss$region
  ss$dst <- ss$region
  ss$regionp <- ss$region
  ss$yearp <- ss$year
  ss$acomm <- ss$comm
  ss$commp <- ss$comm
  ss$slicep <- ss$slice
  rr$set_vec <- ss
  if (scen@solver$import_format == 'gdx') {
  	# Read variables gdx
  	gd = gdx(paste(arg$tmp.dir, '/output/output.gdx', sep = ''))
	  for (i in c(vrb_list, vrb_list2)) {
	    jj <- gd[i]
	    if (length(grep('region', colnames(jj))) == 2)
	    	colnames(jj)[grep('region', colnames(jj))] <- c('src', 'dst')
	    if (ncol(jj) == 1) {
	      rr$variables[[i]] <- data.frame(value = jj[1, 1])
	    } else {
	      for (j in seq_len(ncol(jj))[colnames(jj) != 'value']) {
	        # Remove [.][:digit:] if any
	        if (all(colnames(jj)[j] != names(rr$set_vec))) 
	          colnames(jj)[j] <- gsub('[.].*', '', colnames(jj)[j])
	        # Save all data with all levels
	        if (colnames(jj)[j] != 'year') {
	          jj[, j] <- factor(jj[, j], levels = sort(rr$set_vec[[colnames(jj)[j]]]))
	        } else {
	          jj[, j] <- as.integer(jj[, j])
	        }
	        	
	      }
	      rr$variables[[i]] <- jj
	    }
	  }
  } else {
	  # Read variables csv
	  for (i in c(vrb_list, vrb_list2)) {
	    jj <- arg$readOutputFunction(paste(arg$tmp.dir, '/output/', i, '.csv', sep = ''), 
	                                 stringsAsFactors = FALSE)
	    if (ncol(jj) == 1) {
	      rr$variables[[i]] <- data.frame(value = jj[1, 1])
	    } else {
	      for (j in seq_len(ncol(jj))[colnames(jj) != 'value']) {
	        # Remove [.][:digit:] if any
	        if (all(colnames(jj)[j] != names(rr$set_vec))) 
	          colnames(jj)[j] <- gsub('[.].*', '', colnames(jj)[j])
	        # Save all data with all levels
	        if (colnames(jj)[j] != 'year')
	        	jj[, j] <- factor(jj[, j], levels = sort(rr$set_vec[[colnames(jj)[j]]]))
	      }
	      rr$variables[[i]] <- jj
	    }
	  }
  }
  scen@modOut <- new('modOut')
  # Read solution status
  scen@modOut@solutionLogs <- read.csv(paste(arg$tmp.dir, '/output/log.csv', sep = ''))
  solver_data <- read.csv(paste(arg$tmp.dir, '/solver', sep = ''), stringsAsFactors = FALSE)
  codes <- solver_data[grep('^code', solver_data$name), ]
  for (i in seq_len(nrow(codes))) {
    scen@solver[[codes[i, 'name']]] <- readLines(paste(arg$tmp.dir, '/', codes[i, 'value'], sep = ''))
  }
  if (all(scen@modOut@solutionLogs$parameter != "solution status")) {
    scen@modOut@stage <- "Scenario is not solved"
  } else if (all(scen@modOut@solutionLogs[scen@modOut@solutionLogs$parameter == "solution status", 'value'] != 1)) {
    scen@modOut@stage <- paste0('The solution status is not optimal (', 
        scen@modOut@solutionLogs[scen@modOut@solutionLogs$parameter == "solution status", 'value'], ')')
  } else if (all(scen@modOut@solutionLogs$parameter != "done")) {
    scen@modOut@stage <- "Unexpected termination"
  } else scen@modOut@stage <- 'solved'
 
  if (scen@modOut@stage != 'solved')
    warning(scen@modOut@stage)
  
  scen@modOut@sets <- rr$set_vec
  scen@modOut@variables <- rr$variables
  if (!is.null(scen@misc$data.before)) {
  	scen <- .paste_base_result2new(scen)
  }
  ## Salvage cost calculation
  salvage_cost0 <- function(scen, par) {
    invcost <- .add_dropped_zeros(scen@modInp, paste0('p', par, 'Invcost'))
    olife <- .add_dropped_zeros(scen@modInp, paste0('p', par, 'Olife'))
    discount <- .add_dropped_zeros(scen@modInp, 'pDiscount')
    newcap <- scen@modOut@variables[[paste0('v', par, 'NewCap')]]
    invcost$invcost <- invcost$value; invcost$value <- NULL
    olife$olife <- olife$value; olife$value <- NULL
    discount$discount <- discount$value; discount$value <- NULL
    newcap$newcap <- newcap$value; newcap$value <- NULL
    
    salvage <- merge(merge(newcap, merge(olife, invcost)), discount, all.x = TRUE)
    end_year <- max(.get_data_slot(scen@modInp@parameters$mEndMilestone)$yearp)
    salvage <- merge(salvage, .get_data_slot(scen@modInp@parameters$mStartMilestone))
    salvage$start <- salvage$yearp; salvage$yearp <- NULL
    salvage <- salvage[salvage$start + salvage$olife > end_year, ]
    
    salvage$value <- salvage$newcap * salvage$invcost * ((1 + salvage$discount)^(salvage$olife) - 
        (1 + salvage$discount)^(end_year - salvage$start + 1)) / ((1 + salvage$discount)^salvage$olife - 1) 
     
    fl <- (salvage$discount == 0)
    salvage$value[fl] <- (salvage$newcap * salvage$invcost * (salvage$olife - (end_year - salvage$start + 1)) / salvage$olife)[fl] 
    
    salvage[, c(3, 2, 1, 9)]
  }
  if (scen@modOut@stage == 'solved') {
    # Postprocessing
    scen@modOut@variables$vTechSalv <- salvage_cost0(scen, 'Tech')
    scen@modOut@variables$vStorageSalv <- salvage_cost0(scen, 'Storage')
    scen@modOut@variables$vTradeSalv <- salvage_cost0(scen, 'Trade')
    pDummyImportCost <- .get_data_slot(scen@modInp@parameters$pDummyImportCost)
    vDummyImportCost <- merge(pDummyImportCost, scen@modOut@variables$vDummyImport, by = c('comm', 'region', 'year', 'slice')[c('comm', 'region', 'year', 'slice') %in% colnames(pDummyImportCost)])
    vDummyImportCost$value <- vDummyImportCost$value.x * vDummyImportCost$value.y;
    vDummyImportCost$value.x <- NULL; vDummyImportCost$value.y <- NULL;
    scen@modOut@variables$vDummyImportCost <- vDummyImportCost
    pDummyExportCost <- .get_data_slot(scen@modInp@parameters$pDummyExportCost)
    vDummyExportCost <- merge(pDummyExportCost, scen@modOut@variables$vDummyExport, 
      by = c('comm', 'region', 'year', 'slice')[c('comm', 'region', 'year', 'slice') %in% colnames(pDummyExportCost)])
    vDummyExportCost$value <- vDummyExportCost$value.x * vDummyExportCost$value.y;
    vDummyExportCost$value.x <- NULL; vDummyExportCost$value.y <- NULL;
    scen@modOut@variables$vDummyExportCost <- vDummyExportCost
    tmp <- .get_data_slot(scen@modInp@parameters$pEmissionFactor)
    tmp$comm2 <- tmp$commp; tmp$commp <- tmp$comm; tmp$comm <- tmp$comm2; tmp$comm2 <- NULL
    pTechEmisComm <- .get_data_slot(scen@modInp@parameters$pTechEmisComm)
    vTechEmsFuel <- merge(merge(pTechEmisComm, 
      scen@modOut@variables$vTechInp, by = c('tech', 'comm')), tmp, by = 'comm')
    vTechEmsFuel$comm <- vTechEmsFuel$commp
    if (nrow(vTechEmsFuel) > 0) {
      vTechEmsFuel <- aggregate(vTechEmsFuel$value.x * vTechEmsFuel$value.y * vTechEmsFuel$value, 
        vTechEmsFuel[, c('tech', 'comm', 'region', 'year', 'slice')], sum)
      vTechEmsFuel$value <- vTechEmsFuel$x; vTechEmsFuel$x <- NULL
    } else {
      vTechEmsFuel <- data.frame(tech = character(), comm = character(), region = character(), 
        year = numeric(), value = numeric(), stringsAsFactors = FALSE)
    }
    scen@modOut@variables$vTechEmsFuel <- vTechEmsFuel
    
    # Estimate Costs
    if (length(getNames(scen, 'costs')) != 0) {
    	cst <- getObjects(scen, 'costs')
    	costs_tot <- data.frame(costs = character(), region = character(), year = numeric(), 
    													value = numeric(), stringsAsFactors = FALSE)
    	for (tmp in cst) {
	    	in_dat <- scen@modOut@variables[[tmp@variable]]
	    	if (anyDuplicated(energyRt:::.variable_set[[tmp@variable]])) {
			    sets <- energyRt:::.variable_set[[tmp@variable]]
			    sets[duplicated(sets)] <- paste0(sets[duplicated(sets)], 2)
			    colnames(in_dat) <- c(sets, 'value')
			  }
	    	if (nrow(in_dat) != 0 && !is.null(scen@modInp@parameters[[paste0('mCosts', tmp@name)]]))
	    		in_dat <- merge(in_dat, .get_data_slot(scen@modInp@parameters[[paste0('mCosts', tmp@name)]]))
	    	if (nrow(in_dat) != 0 && !is.null(scen@modInp@parameters[[paste0('pCosts', tmp@name)]])) {
	    		prm <- .get_data_slot(scen@modInp@parameters[[paste0('pCosts', tmp@name)]])
	    		if (ncol(prm) == 1) in_dat$value <- in_dat$value * prm$value else {
	    			colnames(prm)[ncol(prm)] <- 'par'
	    			in_dat <- merge(in_dat, prm)
	    			in_dat$value <- in_dat$value * in_dat$par
	    			in_dat$par <- NULL
	    		}
	    	}
	    	if (nrow(in_dat) != 0) {
		    	in_dat <- aggregate(in_dat[, 'value', drop = FALSE], in_dat[, c('region', 'year'), drop = FALSE], sum)
		    	in_dat$costs <- tmp@name
	    		costs_tot <- rbind(costs_tot, in_dat[, c('costs', 'region', 'year', 'value'), drop = FALSE])
	    	}
    	}
   		scen@modOut@variables$vUserCosts <- costs_tot
  	}
  }
  if (arg$echo) cat('Reading solution: ', round(proc.time()[3] - read_result_time, 2), 's\n', sep = '')
  if (scen@modOut@stage == 'solved') scen@status$optimal <- TRUE
  invisible(scen)
}

read_solution <- read.scenario
# read.scenario <- function(scen, ...) read_solution(scen, ...)
# .S3method("read", "scenario", read_solution)

.paste_base_result2new <- function(scen) {
	# Have to recalculate vObjective (need recalculate salvage before and so on, draft in Github/Misc/package/temp/interpolate_after_for_rest.R)
	for (i in names(scen@misc$data.before)) {
		scen@modOut@variables[[i]] <- rbind(scen@modOut@variables[[i]], scen@misc$data.before[[i]])
	}
	# Correct RowTradeAccumulated
	if (nrow(scen@modOut@variables$vExportRowAccumulated) > 0)
		scen@modOut@variables$vExportRowAccumulated <- aggregate(scen@modOut@variables$vExportRowAccumulated[, 'value', drop = FALSE],
			scen@modOut@variables$vExportRowAccumulated[, c('expp', 'comm'), drop = FALSE], sum)
	if (nrow(scen@modOut@variables$vImportRowAccumulated) > 0)
		scen@modOut@variables$vImportRowAccumulated <- aggregate(scen@modOut@variables$vImportRowAccumulated[, 'value', drop = FALSE],
			scen@modOut@variables$vImportRowAccumulated[, c('imp', 'comm'), drop = FALSE], sum)
  scen	
}

# 
