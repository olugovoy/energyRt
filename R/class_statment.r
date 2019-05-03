#---------------------------------------------------------------------------------------------------------
# equation
#---------------------------------------------------------------------------------------------------------
setClass('statement', 
         representation(
           name          = "character",
           description   = "character",       # description
           eq            = "factor",
           for.each      = "list",
           rhs           = "data.frame",
           defVal        = "numeric",
           lhs           = "list",
           misc = "list"
           # parameter= list() # For the future
         ),
         prototype(
           name          = NULL,
           description   = '',       # description
           eq            = factor('==', levels = c('>=', '<=', '==')),
           for.each      = list(),
           rhs           = data.frame(),
           defVal        = 0,
           lhs           = list(),
           #! Misc
           misc = list(
           )),
         S3methods = TRUE
);
setMethod("initialize", "statement", function(.Object, ...) {
  attr(.Object, 'GUID') <- 'b8b3c68c-8d82-4844-aff9-8b12ba6da878'
  .Object
})


#---------------------------------------------------------------------------------------------------------
# term for equation
#---------------------------------------------------------------------------------------------------------
setClass('summand', 
         representation(
           description   = "character",       # description
           variable      = "character",
           for.sum       = "list",
           mult          = "data.frame",
           defVal        = "numeric",
           misc = "list"
           # parameter= list() # For the future
         ),
         prototype(
           description   = NULL,       # description
           variable      = NULL,
           for.sum       = list(),
           mult          = data.frame(),
           defVal        = 1,
           #! Misc
           misc = list(
           )),
         S3methods = TRUE
);


newStatement <- function(name, eq = '==', rhs = data.frame(), for.each = list(), defVal = 0, ...) {
  obj <- new('statement')
  #stopifnot(length(eq) == 1 && eq %in% levels(obj@eq))
  if (length(eq) != 1 || !(eq %in% levels(obj@eq)))   {
    stop('Wrong condition type')
  }
  obj@eq[] <- eq
  if (is.numeric(rhs)) {
    defVal <- rhs
    rhs <- data.frame()
  }
  if (!is.data.frame(rhs) && is.list(rhs) && length(rhs) == 1 && length(rhs[[1]]) == 1) {
    defVal <- rhs[[1]]
    rhs <- data.frame()
  }
  if (is.data.frame(rhs) && ncol(rhs) == 1 && nrow(rhs) == 1) {
    defVal <- rhs[1, 1]
    rhs <- data.frame()
  }
  if (is.numeric(rhs)) {
    defVal <- rhs
    rhs <- data.frame()
  }
  if (!is.data.frame(rhs) && is.list(rhs)) {
    xx <- sapply(rhs, length)
    if (any(xx[1] != xx))
      stop(paste0('Wrong rhs parameters '))
    if (xx[1] >= 1) {
      xx <- data.frame(stringsAsFactors = FALSE)
      xx[seq_len(length(rhs[[1]])), ] <- NA
      for (i in names(rhs)) xx[, i] <- rhs[[i]]
      rhs <- xx
    }
  }
  # TYPE vs SET   
  obj@rhs       <- rhs
  obj@defVal    <- defVal
  obj@name      <- name
  obj@for.each  <- for.each
  arg <- list(...)
  for (i in seq_along(arg)) {
    obj <- addSummand(obj, arg = arg[[i]])
  }
  obj
}


addSummand <- function(eqt, variable = NULL, mult = data.frame(), for.sum = list(), arg) {
  if (!is.null(names(arg))) {
    if (any(names(arg) == 'variable')) variable <- arg$variable
    if (any(names(arg) == 'mult')) mult <- arg$mult
    if (any(names(arg) == 'for.sum')) for.sum <- arg$for.sum
    if (any(names(arg) == 'defVal')) defVal <- arg$defVal
  }
  st <- new('summand')
  st@variable <- variable
  if (!is.data.frame(mult) && is.list(mult)) {
    xx <- sapply(mult, length)
    if (any(xx[1] != xx))
      stop(paste0('Wrong mult parameters '))
    if (xx[1] >= 1) {
      xx <- data.frame(stringsAsFactors = FALSE)
      xx[seq_len(length(mult[[1]])), ] <- NA
      for (i in names(mult)) xx[, i] <- mult[[i]]
      mult <- xx
    }
  }
  if (is.data.frame(mult)) {
    st@mult <- mult
  } else st@defVal <- mult
  st@for.sum <- for.sum
  if (all(names(.vrb_map) != variable)) 
    stop(paste0('Unknown variables "', variable, '"in summands "', eqt@name, '"'))
  need.set <- .vrb_map[[variable]];
  need.set <- need.set[!(need.set %in% c(names(eqt@for.each), names(st@for.sum)))];
  for (i in need.set) {
    st@for.sum[[i]] <- NULL
  }
  if (!all(names(st@mult) %in% c(names(st@for.sum), 'value')))
    stop(paste0('Wrong mult parameter, excessive set: "', paste0(names(st@mult)[!(names(st@mult) %in% names(st@for.sum))], collapse = '", "'), '"'))
  names(st@defVal) <- NULL
  names(st@variable) <- NULL
  eqt@lhs[[length(eqt@lhs) + 1]] <- st
  eqt  
}


#stm <- newStatement('testEx', for.each = list(year = 2012), rhs = data.frame(year = 2012, value = 5),
#                    summand1 = list(variable = 'vTechOut', for.sum = list(year = 2012, tech = c('ELC_COA', 'ELC_GAS')), 
#                                    mult = list(tech = 'ELC_COA', value = 2)))


# Get set values
#prec@set <- lapply(prec@parameters[sapply(prec@parameters, function(x) x@type == 'set')], function(x) getParameterData(x)[, 1])


#  .vrb_map <- energyRt:::.vrb_map
#  .vrb_mapping <- energyRt:::.vrb_mapping
# Calculate do equation need additional set, and add it
.getSetEquation <- function(prec, stm, approxim) {
  assign('prec', prec,  globalenv())
  assign('stm', stm,  globalenv())
  assign('approxim', approxim,  globalenv())
  stop.constr <- function(x) 
    stop(paste0('constrain "', stm@name, '" error: ', x))
  
  # all.set contain all set for for.each & lhs
  # Estimate is need sum for for.each
  # set.map need special mapping or consist all set
  all.set <- data.frame(
    alias = character(), # name in equation
    set = character(),  # original set 
    for.each = logical(), # for.each, lhs
    lhs.num = numeric(),    # number for lhs
    lead.year = logical(),   # use only for year & lhs (next year)
    lag.year = logical(),    # use only for year & lhs (old year)
    def.lhs  = logical(),    # not in for.each
    new.map  = numeric(),    # need new sub set
    stringsAsFactors = FALSE
  )
  set.map <- list()
  set.map.name <- NULL # Temp vector with name for list set.map
  # all.set & set.map
  # for.each
  nn <- seq_len(length(stm@for.each) + sum(sapply(stm@lhs, function(x) length(.vrb_map[[x@variable]]))))
  all.set[seq_along(nn), ] <- NA
  for (i in (1:ncol(all.set))[sapply(all.set, class) == 'logical']) 
    all.set[, i] <- FALSE
  nn <- 0
  if (length(stm@for.each) > 0) {
    nn <- seq_along(stm@for.each)
    all.set[nn, 'set'] <- names(stm@for.each)
    all.set[nn, 'alias'] <- names(stm@for.each)
    all.set[nn, 'for.each'] <- TRUE
    for.each.set <- names(stm@for.each)
    # Fill add.map for for.each
    for (j in for.each.set) {
      if (!is.null(stm@for.each[[j]]) && !all(prec@set[[j]] %in% stm@for.each[[j]])) {
        set.map.name <- c(set.map.name, j)
        set.map[[length(set.map.name)]] <- stm@for.each[[j]]
        all.set[nn[names(stm@for.each) == j], 'new.map'] <- length(set.map.name)
      }
    }
  } else lhs.set <- NULL
  # lhs
  for (i in seq_along(stm@lhs)) {
    need.set <- .vrb_map[[stm@lhs[[i]]@variable]]
    nn <- (nn[length(nn)] + seq_along(need.set))
    all.set[nn, 'set'] <- need.set
    all.set[nn, 'alias'] <- need.set
    all.set[nn, 'lhs.num'] <- i
    if (any(names(stm@lhs[[i]]@for.sum) == 'lag.year')) {
      if (all(need.set != 'year'))
        stop.constr('For lag.year have to define use variable with year')
      all.set[nn[need.set == 'year'], c('lag.year', 'def.lhs')] <- TRUE
    }
    if (any(names(stm@lhs[[i]]@for.sum) == 'lead.year')) {
      if (all(need.set != 'year'))
        stop.constr('For lead.year have to define use variable with year')
      all.set[nn[need.set == 'year'], c('lead.year', 'def.lhs')] <- TRUE
    }
    all.set[nn[need.set %in% names(stm@lhs[[i]]@for.sum)], 'def.lhs'] <- TRUE
    all.set[nn[!(need.set %in% for.each.set)], 'def.lhs'] <- TRUE
    # Add to set map
    st <- names(stm@lhs[[i]]@for.sum)[names(stm@lhs[[i]]@for.sum) %in% need.set & !sapply(stm@lhs[[i]]@for.sum, is.null)]
    # Fill add.map for for.lhs
    for (j in st) {
      if (!all(prec@set[[j]] %in% stm@lhs[[i]]@for.sum[[j]])) {
        set.map.name <- c(set.map.name, j)
        set.map[[length(set.map.name)]] <- stm@lhs[[i]]@for.sum[[j]]
        all.set[nn[need.set == j], 'new.map'] <- length(set.map.name)
      }
    }
  }
  # Add alias
  fl <- (!all.set$for.each & all.set$def.lhs & all.set$set %in% for.each.set)
  if (any(fl)) 
    all.set[fl, 'alias'] <- paste0(all.set[fl, 'set'], 'p')
  if (length(set.map) > 0) {
    new.map.name <- paste0('mCns', stm@name, seq_along(set.map))
    new.map.name.full <- paste0(new.map.name, '(', all.set[!is.na(all.set$new.map), 'alias'], ')')
    for (i in seq_along(set.map)) 
      prec@parameters[[new.map.name[i]]] <- addMultipleSet(createParameter(new.map.name[i], set.map.name[i], 'map'), set.map[[i]])
    # copy new.map for lhs set that define in for each
    fl <- seq_len(nrow(all.set))[all.set$for.each & !is.na(all.set$new.map)]
    for (i in fl) {
      all.set[!all.set$for.each & !all.set$def.lhs & all.set$set == all.set$set[i], 'new.map'] <- i
    }
  }
  

  # Generate GAMS code with mult & rhs parameters
  res <- list()  
  # Declaration equation in model
  res$equationDeclaration2Model <- paste0('eqCns', stm@name)
  # Declaration equation
  if (length(stm@for.each) == 0) {
    res$equationDeclaration <- res$equationDeclaration2Model
  } else {
    res$equationDeclaration <- paste0(res$equationDeclaration2Model, '(', paste0(names(stm@for.each), collapse = ', '), ')')
  }
  # Equation before ..
  res$equation <- res$equationDeclaration
  if (any(all.set$for.each & (all.set == 'year') | !is.na(all.set$new.map))) {
    for.each.set0 <- all.set[all.set$for.each,, drop = FALSE]
    hh <- NULL
    if (any(!is.na(for.each.set0$new.map))) { 
      hh <- c(hh, new.map.name.full[for.each.set0$new.map[!is.na(for.each.set0$new.map)]])
    }
    if (any(for.each.set0$set == 'year')) { 
      hh <- c(hh, 'mMidMilestone(year)')
    }
    if (any(all.set$lag.year)) { 
      hh <- c(hh, 'not(mStartMilestone(year))')
    }
    if (any(all.set$lead.year)) { 
      hh <- c(hh, 'mMilestoneHasNext(year)')
    }
    res$equation <- paste0(res$equation, '$', '('[length(hh) > 1], 
                           paste0(hh, collapse = ' and '), ')'[length(hh) > 1])
    
  }
  res$equation <- paste0(res$equation, '.. ')
  # Add lhs to equation
  lhs.set <- all.set[!all.set$for.each,, drop = FALSE]
  for (i in seq_along(stm@lhs)) {
    vrb <- stm@lhs[[i]]@variable
    lhs.set2 <- lhs.set[lhs.set$lhs.num == i, ]
    vrb.lhs <- .vrb_mapping[[vrb]]
    # Add multiple to vrb
    # Add multiplier
    if (nrow(stm@lhs[[i]]@mult) != 0) {
      # Complicated parameter
      # Generate approxim
      approxim2 <- approxim[unique(c(colnames(stm@lhs[[i]]@mult)[colnames(stm@lhs[[i]]@mult) %in% names(approxim)], 'solver', 'year'))]
      if (any(names(approxim2) == 'slice')) {
        approxim2$slice <- approxim2$slice@all_slice
      }
      need.set <- lhs.set2[lhs.set2$set  %in% colnames(stm@lhs[[i]]@mult), 'set']
      need.set2 <- lhs.set2[!is.na(lhs.set2$new.map) & lhs.set2$set  %in% colnames(stm@lhs[[i]]@mult), ]
      for (j in seq_len(nrow(need.set2))) {
        approxim2[[j]] <- set.map[[need.set2[j, 'new.map']]]
      }
      xx <- createParameter(paste0('pCnsMult', stm@name, '_', i), need.set, 'simple', defVal = stm@lhs[[i]]@defVal, 
                            interpolation = 'back.inter.forth')
      prec@parameters[[xx@name]] <- addData(xx, simpleInterpolation(stm@lhs[[i]]@mult, 'value', xx, approxim2))
      # Add mult
      vrb.lhs <- paste0(xx@name, '(', paste0(need.set, collapse = ', '), ') * ', vrb.lhs)
    } else if (stm@lhs[[i]]@defVal != 1) {
      vrb.lhs <- paste0(stm@lhs[[i]]@defVal, ' * ', vrb.lhs)
    }
    # Replace setsname
    for (j in seq_len(nrow(lhs.set2))[lhs.set2$alias != lhs.set2$set]) {
      vrb.lhs <- gsub(paste0(' ', lhs.set2$set[j], ' '), lhs.set2$alias[j], vrb.lhs)
    }
    vrb.lhs <- gsub('[ ]*[$][ ]*', '$', gsub('[ ]*[)]', ')', gsub('[ ]*[(][ ]*', '(', gsub('[ ]*[,][ ]*', ', ', vrb.lhs))))
    # Generate data to equation
    if (i != 1) res$equation <- paste0(res$equation, '+')
    if (all(!lhs.set2$def.lhs)) {
      res$equation <- paste0(res$equation, vrb.lhs)
    } else {
      lhs.set3 <- lhs.set2[lhs.set2$def.lhs,, drop = FALSE]
      cnd <- NULL
      if (any(!is.na(lhs.set3$new.map))) { 
        cnd <- c(cnd, new.map.name.full[lhs.set3$new.map[!is.na(lhs.set3$new.map)]])
      }
      if (any(lhs.set3$lag.year == 'year')) { 
        cnd <- c(cnd, 'mMilestoneNext(yearp, year)')
      } else if (any(lhs.set3$lead.year)) { 
        cnd <- c(cnd, 'mMilestoneNext(year, yearp)')
      } else if (any(lhs.set3$set == 'year')) { 
        cnd <- c(cnd, 'mMidMilestone(year)')
      }
      if (any(grep('[$]', vrb.lhs))) {
        tmp <- gsub('.*[$]', '', vrb.lhs)
        if (substr(tmp, 1, 1) == '(') 
          tmp <- substr(tmp, 2, nchar(tmp) - 1)
        cnd <- c(cnd, tmp)
        vrb.lhs <- gsub('[$].*', '', vrb.lhs)
      }
      if (any(!is.na(lhs.set3$new.map))) 
        cnd <- c(cnd, new.map.name.full[lhs.set3$new.map[!is.na(lhs.set3$new.map)]])
      # Finish for sum
      if (sum(lhs.set2$def.lhs) == 1) {
        res$equation <- paste0(res$equation, ' sum(', lhs.set3$alias);
      } else {
        res$equation <- paste0(res$equation, ' sum((', paste0(lhs.set3$alias, collapse = ', '), ')');
      }
      if (length(cnd) == 1) {
        res$equation <- paste0(res$equation, '$', cnd, ', ', vrb.lhs, ')')
      } else if (length(cnd) > 1) {
        res$equation <- paste0(res$equation, '$(', paste0(cnd, collapse = ' and '), '), ', vrb.lhs, ')')
      } else {
        stop('error!')
      }
    }
  }
  # Add eq
  res$equation <- paste0(res$equation, ' ', c('==' = '=e=', '>=' = '=g=', '<=' = '=l=')[as.character(stm@eq)], ' ')
  # Add rhs
  if (nrow(stm@rhs) != 0) {
    # Complicated rhs
    # Generate approxim
    approxim2 <- approxim[unique(c(colnames(stm@rhs)[colnames(stm@rhs) %in% names(approxim)], 'solver', 'year'))]
    if (any(names(approxim2) == 'slice')) {
      approxim2$slice <- approxim2$slice@all_slice
    }
    need.set <- all.set[all.set$for.each & !is.na(all.set$new.map) & all.set$set %in% colnames(stm@rhs),, drop = FALSE]
    for (j in seq_len(nrow(need.set))) {
      approxim2[[j]] <- set.map[[need.set[j, 'new.map']]]
    }
    need.set0 <- for.each.set[for.each.set %in% colnames(stm@rhs)]
    xx <- createParameter(paste0('pCnsRhs', stm@name), need.set0, 'simple', defVal = stm@defVal, 
                          interpolation = 'back.inter.forth', colName = 'rhs')
    prec@parameters[[xx@name]] <- addData(xx, simpleInterpolation(stm@rhs, 'rhs', xx, approxim2))
    # Add mult
    res$equation <- paste0(res$equation, xx@name, '(', paste0(need.set0, collapse = ', '), ')')
  } else {
    res$equation <- paste0(res$equation, stm@defVal)
  }
  res$equation <- paste0(res$equation, ';')
  prec@gams.equation[[stm@name]] <- res
  prec
}

#  .getSetEquation(prec, stm, approxim)@gams.equation
