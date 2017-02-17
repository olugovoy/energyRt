constrCodeProduce <- function(.Object) {
  .Object@maptable[['mPreDefTechUse']] <- MapTable('mPreDefTechUse', c('tech', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefTechUse']] <- MapTable('preDefTechUse', c('tech', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefTechNewCap']] <- MapTable('mPreDefTechNewCap', c('tech', 'region', 'year'), 'map')
  .Object@maptable[['preDefTechNewCap']] <- MapTable('preDefTechNewCap', c('tech', 'region', 'year'), 'single', default = 0)
  .Object@maptable[['mPreDefTechRetirementCap']] <- MapTable('mPreDefTechRetirementCap', c('tech', 'region', 'year', 'yearp'), 'map')
  .Object@maptable[['preDefTechRetirementCap']] <- MapTable('preDefTechRetirementCap', c('tech', 'region', 'year', 'yearp'), 'single', default = 0)
  .Object@maptable[['mPreDefTechCap']] <- MapTable('mPreDefTechCap', c('tech', 'region', 'year'), 'map')
  .Object@maptable[['preDefTechCap']] <- MapTable('preDefTechCap', c('tech', 'region', 'year'), 'single', default = 0)
  .Object@maptable[['mPreDefTechAct']] <- MapTable('mPreDefTechAct', c('tech', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefTechAct']] <- MapTable('preDefTechAct', c('tech', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefTechInp']] <- MapTable('mPreDefTechInp', c('tech', 'comm', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefTechInp']] <- MapTable('preDefTechInp', c('tech', 'comm', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefTechOut']] <- MapTable('mPreDefTechOut', c('tech', 'comm', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefTechOut']] <- MapTable('preDefTechOut', c('tech', 'comm', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefTechAInp']] <- MapTable('mPreDefTechAInp', c('tech', 'comm', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefTechAInp']] <- MapTable('preDefTechAInp', c('tech', 'comm', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefTechAOut']] <- MapTable('mPreDefTechAOut', c('tech', 'comm', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefTechAOut']] <- MapTable('preDefTechAOut', c('tech', 'comm', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefSupOut']] <- MapTable('mPreDefSupOut', c('sup', 'comm', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefSupOut']] <- MapTable('preDefSupOut', c('sup', 'comm', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefDemInp']] <- MapTable('mPreDefDemInp', c('comm', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefDemInp']] <- MapTable('preDefDemInp', c('comm', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefDumOut']] <- MapTable('mPreDefDumOut', c('comm', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefDumOut']] <- MapTable('preDefDumOut', c('comm', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefStorageInp']] <- MapTable('mPreDefStorageInp', c('stg', 'comm', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefStorageInp']] <- MapTable('preDefStorageInp', c('stg', 'comm', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefStorageOut']] <- MapTable('mPreDefStorageOut', c('stg', 'comm', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefStorageOut']] <- MapTable('preDefStorageOut', c('stg', 'comm', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefStorageStore']] <- MapTable('mPreDefStorageStore', c('stg', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefStorageStore']] <- MapTable('preDefStorageStore', c('stg', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefStorageCap']] <- MapTable('mPreDefStorageCap', c('stg', 'region', 'year'), 'map')
  .Object@maptable[['preDefStorageCap']] <- MapTable('preDefStorageCap', c('stg', 'region', 'year'), 'single', default = 0)
  .Object@maptable[['mPreDefStorageNewCap']] <- MapTable('mPreDefStorageNewCap', c('stg', 'region', 'year'), 'map')
  .Object@maptable[['preDefStorageNewCap']] <- MapTable('preDefStorageNewCap', c('stg', 'region', 'year'), 'single', default = 0)
  .Object@maptable[['mPreDefImport']] <- MapTable('mPreDefImport', c('comm', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefImport']] <- MapTable('preDefImport', c('comm', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefExport']] <- MapTable('mPreDefExport', c('comm', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefExport']] <- MapTable('preDefExport', c('comm', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefTradeIr']] <- MapTable('mPreDefTradeIr', c('trade', 'region', 'regionp', 'year', 'slice'), 'map')
  .Object@maptable[['preDefTradeIr']] <- MapTable('preDefTradeIr', c('trade', 'region', 'regionp', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefExportRow']] <- MapTable('mPreDefExportRow', c('expp', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefExportRow']] <- MapTable('preDefExportRow', c('expp', 'region', 'year', 'slice'), 'single', default = 0)
  .Object@maptable[['mPreDefImportRow']] <- MapTable('mPreDefImportRow', c('imp', 'region', 'year', 'slice'), 'map')
  .Object@maptable[['preDefImportRow']] <- MapTable('preDefImportRow', c('imp', 'region', 'year', 'slice'), 'single', default = 0)
.Object
}
