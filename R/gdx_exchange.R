.get_scen_data <- function(scen) {
  all_factor <- function(x) {
    for (i in colnames(x)[colnames(x) != 'value'])
      x[[i]] <- factor(x[[i]])
    x
  }
  gg <- list()
  for (i in names(scen@modInp@parameters)) {
    if (scen@modInp@parameters[[i]]@type != 'multi') {
      gg[[i]] <- all_factor(getParameterData(scen@modInp@parameters[[i]]))
    } else {
      tmp <- getParameterData(scen@modInp@parameters[[i]])
      gg[[paste0(i, 'Lo')]] <- all_factor(tmp[tmp$type == 'lo', colnames(tmp) != 'type'])
      gg[[paste0(i, 'Up')]] <- all_factor(tmp[tmp$type == 'up', colnames(tmp) != 'type'])
    }
    gg
  }
  return(gg)
}

.df2uels <- function(df, name = "x", value = "value") {
  # The function takes data frame or character vector and returns
  # named list for exporting to GDX-file using gdxrrw
  if (!is.data.frame(df)) {
    df <- data.frame(df)
    colnames(df) <- name
  }
  domains <- names(df)
  v = domains != value
  nr <- nrow(df)
  nc <- sum(v)
  if (all(v)) {
    type = "set"
  } else {
    type = "parameter"
  }
  df2val <- function(dd) {
    if (nrow(dd) > 0) {
      for(j in domains[v]) {
        dd[,j] <- as.numeric(dd[,j])
      }
      dd <- as.matrix(dd)
    } else {
      rr = nr
      if (type == "set") rr = 1
      dd <- matrix(1L, nrow = rr, ncol = length(v))
    }
    dd
  }
  if (nr > 0) {
    for(j in domains[v]) {
      df[,j] <- factor(df[,j]) # add levels from sets!
    }
    uels <- list(
      name = name,
      type = type,
      dim = nc,
      domains = domains[v],
      uels = lapply(domains[v], function(x) levels(df[,x])),
      val = df2val(df),
      form = "sparse"
    )  
  } else {
    uels <- list(
      name = name,
      type = type,
      dim = nc,
      domains = domains[v],
      uels = lapply(domains[v], function(x) "1"),
      val = df2val(df), #matrix(nrow = 0, ncol = nc),
      form = "sparse"
    )
  }
  return(uels)
}

.write_gdx_list <- function(dat, gdxName = "data.gdx") {
  # the function exports names list of sets and parameters 
  # to GDX file
  stopifnot("gdxrrw" %in% rownames(installed.packages()))
  # cat("Writing to ", gdxName)
  cat(" data.gdx ")
  nms <- names(dat)
  x <- list()
  for(i in nms) {
    x <- c(x, list(.df2uels(dat[[i]], i)))
  }
  gdxrrw::wgdx(gdxName = gdxName, x, squeeze = FALSE)
}

.write_sqlite_list <- function(dat, sqlFile = "data.db") {
  tStart <- Sys.time()
  if (file.exists(sqlFile)) file.remove(sqlFile)
  con <- DBI::dbConnect(RSQLite::SQLite(), sqlFile)
  DBI::dbListTables(con)
  (nms <- names(dat))
  con <- DBI::dbConnect(RSQLite::SQLite(), sqlFile)
  # DBI::dbListTables(con)
  nms <- names(dat)
  wipe <- ""
  for(i in nms) {
    cat(wipe, i, rep(" ", 10), sep = "")
    wipe <- paste0(rep("\b", nchar(i) + 10), collapse = "")
    DBI::dbWriteTable(con, i, dat[[i]], overwrite = TRUE)
  }
  # DBI::dbListTables(con)
  # DBI::dbReadTable(con, "region")
  # DBI::dbReadTable(con, "pTechCinp2use") %>% as_tibble()
  DBI::dbDisconnect(con)
  finf <- file.info("tmp/data.db")
  format(finf["size"])
  cat(", ", utils:::format.object_size(file.size(sqlFile), "auto"), ", ", sep = "")
  cat(format(Sys.time() - tStart))
}