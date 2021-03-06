setClass("trade",
      representation(
    # General information
        name          = "character",       # Short name
        description   = "character",       # Details
        commodity     = "character",       # Vector if NULL that
        routes        = "data.frame",       
    # Performance parameters
        trade         = "data.frame",
        aux           = "data.frame",      #
        aeff         = "data.frame",    #  Commodity efficiency
      	invcost = "data.frame",
      	olife = "numeric",
      	start = "numeric",
      	end = "numeric",
      	stock = "data.frame",
      	capacityVariable = "logical",
      	# GIS                = "GIS", # @GIS # setClassUnion("GIS", members=c("SpatialPolygonsDataFrame", "NULL"))
      	cap2act       = "numeric",         #
      	misc = "list"
      ),
	# Default values and structure of slots
	prototype(
		# General information
		name           = "default_trade",       # Short name
		description    = "",
		commodity      = NULL,       #
		routes       = data.frame(
		  src        = character(),
		  dst        = character(),
		  stringsAsFactors = FALSE),
		trade          = data.frame(
			src        = character(),
			dst        = character(),
			year       = numeric(),
			slice      = character(),
			ava.up     = numeric(),
			ava.fx     = numeric(),
			ava.lo     = numeric(),
			cost       = numeric(),
			markup     = numeric(),
			teff        = numeric(),
			stringsAsFactors = FALSE),
		invcost = data.frame(
			region        = character(),
			year       = numeric(),
			invcost    = numeric(),
			stringsAsFactors = FALSE),
		olife = Inf,
		start = -Inf,
		end = Inf,
		stock         = data.frame(
			year  = integer(),
			stock = numeric(),
			stringsAsFactors = FALSE),
		capacityVariable = FALSE,
		aux           = data.frame(
		  acomm     = character(),
			unit     = character(),
			stringsAsFactors = FALSE),
		# Auxilary parameter
		aeff          = data.frame(
			acomm      = character(),
			src     = character(),
			dst     = character(),
			year       = numeric(),
			slice      = character(),
			csrc2aout  = numeric(),
			csrc2ainp  = numeric(),
			cdst2aout  = numeric(),
			cdst2ainp  = numeric(),
			stringsAsFactors = FALSE),
		cap2act       = 1,         #
		# GIS           = NULL,
		#! Misc
		misc = list(
		)),
	S3methods = TRUE
);
setMethod("initialize", "trade", function(.Object, ...) {
	.Object
})
