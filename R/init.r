# load('data/convert_data.RData')
#.modelCode <- list(GAMS = list(reduced = readLines('gams/model_reduced.gms')),
#                  GLPK = list(reduced = readLines('glpk/glpk_reduced.mod')))
#save(file = 'data/modelCode.RData', list = 'modelCode')

.modelCode <- list(GAMS = readLines('c:/111/github/energyRt/gams/energyRt.gms'),
                   GLPK = readLines('c:/111/github/energyRt/glpk/energyRt.mod'))


