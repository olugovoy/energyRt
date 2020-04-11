.vrb_map = list(
    vTechNewCap = c("tech", "region", "year"), 
    vTechRetirementStock = c("tech", "region", "year"), 
    vTechRetirementNewCap = c("tech", "region", "year", "year"), 
    vTechCap = c("tech", "region", "year"), 
    vTechAct = c("tech", "region", "year", "slice"), 
    vTechInp = c("tech", "comm", "region", "year", "slice"), 
    vTechOut = c("tech", "comm", "region", "year", "slice"), 
    vTechAInp = c("tech", "comm", "region", "year", "slice"), 
    vTechAOut = c("tech", "comm", "region", "year", "slice"), 
    vTechInv = c("tech", "region", "year"), 
    vTechEac = c("tech", "region", "year"), 
    vTechOMCost = c("tech", "region", "year"), 
    vSupOut = c("sup", "comm", "region", "year", "slice"), 
    vSupReserve = c("sup", "comm", "region"), 
    vSupCost = c("sup", "region", "year"), 
    vDemInp = c("comm", "region", "year", "slice"), 
    vEmsFuelTot = c("comm", "region", "year", "slice"), 
    vBalance = c("comm", "region", "year", "slice"), 
    vOutTot = c("comm", "region", "year", "slice"), 
    vInpTot = c("comm", "region", "year", "slice"), 
    vInp2Lo = c("comm", "region", "year", "slice", "slice"), 
    vOut2Lo = c("comm", "region", "year", "slice", "slice"), 
    vSupOutTot = c("comm", "region", "year", "slice"), 
    vTechInpTot = c("comm", "region", "year", "slice"), 
    vTechOutTot = c("comm", "region", "year", "slice"), 
    vStorageInpTot = c("comm", "region", "year", "slice"), 
    vStorageOutTot = c("comm", "region", "year", "slice"), 
    vStorageAInp = c("stg", "comm", "region", "year", "slice"), 
    vStorageAOut = c("stg", "comm", "region", "year", "slice"), 
    vTotalCost = c("region", "year"), 
    vDummyImport = c("comm", "region", "year", "slice"), 
    vDummyExport = c("comm", "region", "year", "slice"), 
    vTaxCost = c("comm", "region", "year"), 
    vSubsCost = c("comm", "region", "year"), 
    vAggOut = c("comm", "region", "year", "slice"), 
    vStorageInp = c("stg", "comm", "region", "year", "slice"), 
    vStorageOut = c("stg", "comm", "region", "year", "slice"), 
    vStorageStore = c("stg", "comm", "region", "year", "slice"), 
    vStorageInv = c("stg", "region", "year"), 
    vStorageEac = c("stg", "region", "year"), 
    vStorageCap = c("stg", "region", "year"), 
    vStorageNewCap = c("stg", "region", "year"), 
    vStorageOMCost = c("stg", "region", "year"), 
    vImport = c("comm", "region", "year", "slice"), 
    vExport = c("comm", "region", "year", "slice"), 
    vTradeIr = c("trade", "comm", "region", "region", "year", "slice"), 
    vTradeIrAInp = c("trade", "comm", "region", "year", "slice"), 
    vTradeIrAInpTot = c("comm", "region", "year", "slice"), 
    vTradeIrAOut = c("trade", "comm", "region", "year", "slice"), 
    vTradeIrAOutTot = c("comm", "region", "year", "slice"), 
    vExportRowAccumulated = c("expp", "comm"), 
    vExportRow = c("expp", "comm", "region", "year", "slice"), 
    vImportRowAccumulated = c("imp", "comm"), 
    vImportRow = c("imp", "comm", "region", "year", "slice"), 
    vTradeCost = c("region", "year"), 
    vTradeRowCost = c("region", "year"), 
    vTradeIrCost = c("region", "year"), 
    vTradeCap = c("trade", "year"), 
    vTradeInv = c("trade", "region", "year"), 
    vTradeEac = c("trade", "region", "year"), 
    vTradeNewCap = c("trade", "year")
);
.vrb_mapping = list(
    vTechNewCap = "vTechNewCap( tech , region , year ) $ mTechNew( tech , region , year )",
  vTechRetirementStock = "vTechRetirementStock( tech , region , year ) $ mvTechRetirementStock( tech , region , year )",
  vTechRetirementNewCap = "vTechRetirementNewCap( tech , region , year , year ) $ mvTechRetiredNewCap( tech , region , year , year )",
  vTechCap = "vTechCap( tech , region , year ) $ mTechSpan( tech , region , year )",
  vTechAct = "vTechAct( tech , region , year , slice ) $ mvTechAct( tech , region , year , slice )",
  vTechInp = "vTechInp( tech , comm , region , year , slice ) $ mvTechInp( tech , comm , region , year , slice )",
  vTechOut = "vTechOut( tech , comm , region , year , slice ) $ mvTechOut( tech , comm , region , year , slice )",
  vTechAInp = "vTechAInp( tech , comm , region , year , slice ) $ mvTechAInp( tech , comm , region , year , slice )",
  vTechAOut = "vTechAOut( tech , comm , region , year , slice ) $ mvTechAOut( tech , comm , region , year , slice )",
  vTechInv = "vTechInv( tech , region , year ) $ mTechNew( tech , region , year )",
  vTechEac = "vTechEac( tech , region , year ) $ mTechEac( tech , region , year )",
  vTechOMCost = "vTechOMCost( tech , region , year ) $ mTechOMCost( tech , region , year )",
  vSupOut = "vSupOut( sup , comm , region , year , slice ) $ mSupAva( sup , comm , region , year , slice )",
  vSupReserve = "vSupReserve( sup , comm , region ) $ mvSupReserve( sup , comm , region )",
  vSupCost = "vSupCost( sup , region , year ) $ mvSupCost( sup , region , year )",
  vDemInp = "vDemInp( comm , region , year , slice ) $ mvDemInp( comm , region , year , slice )",
  vEmsFuelTot = "vEmsFuelTot( comm , region , year , slice ) $ mEmsFuelTot( comm , region , year , slice )",
  vBalance = "vBalance( comm , region , year , slice ) $ mvBalance( comm , region , year , slice )",
  vOutTot = "vOutTot( comm , region , year , slice ) $ mvOutTot( comm , region , year , slice )",
  vInpTot = "vInpTot( comm , region , year , slice ) $ mvInpTot( comm , region , year , slice )",
  vInp2Lo = "vInp2Lo( comm , region , year , slice , slice ) $ mvInp2Lo( comm , region , year , slice , slice )",
  vOut2Lo = "vOut2Lo( comm , region , year , slice , slice ) $ mvOut2Lo( comm , region , year , slice , slice )",
  vSupOutTot = "vSupOutTot( comm , region , year , slice ) $ mSupOutTot( comm , region , year , slice )",
  vTechInpTot = "vTechInpTot( comm , region , year , slice ) $ mTechInpTot( comm , region , year , slice )",
  vTechOutTot = "vTechOutTot( comm , region , year , slice ) $ mTechOutTot( comm , region , year , slice )",
  vStorageInpTot = "vStorageInpTot( comm , region , year , slice ) $ mStorageInpTot( comm , region , year , slice )",
  vStorageOutTot = "vStorageOutTot( comm , region , year , slice ) $ mStorageOutTot( comm , region , year , slice )",
  vStorageAInp = "vStorageAInp( stg , comm , region , year , slice ) $ mvStorageAInp( stg , comm , region , year , slice )",
  vStorageAOut = "vStorageAOut( stg , comm , region , year , slice ) $ mvStorageAOut( stg , comm , region , year , slice )",
  vTotalCost = "vTotalCost( region , year ) $ mvTotalCost( region , year )",
  vDummyImport = "vDummyImport( comm , region , year , slice ) $ mDummyImport( comm , region , year , slice )",
  vDummyExport = "vDummyExport( comm , region , year , slice ) $ mDummyExport( comm , region , year , slice )",
  vTaxCost = "vTaxCost( comm , region , year ) $ mTaxCost( comm , region , year )",
  vSubsCost = "vSubsCost( comm , region , year ) $ mSubsCost( comm , region , year )",
  vAggOut = "vAggOut( comm , region , year , slice ) $ mAggOut( comm , region , year , slice )",
  vStorageInp = "vStorageInp( stg , comm , region , year , slice ) $ mvStorageStore( stg , comm , region , year , slice )",
  vStorageOut = "vStorageOut( stg , comm , region , year , slice ) $ mvStorageStore( stg , comm , region , year , slice )",
  vStorageStore = "vStorageStore( stg , comm , region , year , slice ) $ mvStorageStore( stg , comm , region , year , slice )",
  vStorageInv = "vStorageInv( stg , region , year ) $ mStorageNew( stg , region , year )",
  vStorageEac = "vStorageEac( stg , region , year ) $ mStorageEac( stg , region , year )",
  vStorageCap = "vStorageCap( stg , region , year ) $ mStorageSpan( stg , region , year )",
  vStorageNewCap = "vStorageNewCap( stg , region , year ) $ mStorageNew( stg , region , year )",
  vStorageOMCost = "vStorageOMCost( stg , region , year ) $ mStorageOMCost( stg , region , year )",
  vImport = "vImport( comm , region , year , slice ) $ mImport( comm , region , year , slice )",
  vExport = "vExport( comm , region , year , slice ) $ mExport( comm , region , year , slice )",
  vTradeIr = "vTradeIr( trade , comm , region , region , year , slice ) $ mvTradeIr( trade , comm , region , region , year , slice )",
  vTradeIrAInp = "vTradeIrAInp( trade , comm , region , year , slice ) $ mvTradeIrAInp( trade , comm , region , year , slice )",
  vTradeIrAInpTot = "vTradeIrAInpTot( comm , region , year , slice ) $ mvTradeIrAInpTot( comm , region , year , slice )",
  vTradeIrAOut = "vTradeIrAOut( trade , comm , region , year , slice ) $ mvTradeIrAOut( trade , comm , region , year , slice )",
  vTradeIrAOutTot = "vTradeIrAOutTot( comm , region , year , slice ) $ mvTradeIrAOutTot( comm , region , year , slice )",
  vExportRowAccumulated = "vExportRowAccumulated( expp , comm ) $ mExpComm( expp , comm )",
  vExportRow = "vExportRow( expp , comm , region , year , slice ) $ mExportRow( expp , comm , region , year , slice )",
  vImportRowAccumulated = "vImportRowAccumulated( imp , comm ) $ mImpComm( imp , comm )",
  vImportRow = "vImportRow( imp , comm , region , year , slice ) $ mImportRow( imp , comm , region , year , slice )",
  vTradeCost = "vTradeCost( region , year ) $ mvTradeCost( region , year )",
  vTradeRowCost = "vTradeRowCost( region , year ) $ mvTradeRowCost( region , year )",
  vTradeIrCost = "vTradeIrCost( region , year ) $ mvTradeIrCost( region , year )",
  vTradeCap = "vTradeCap( trade , year ) $ mTradeSpan( trade , year )",
  vTradeInv = "vTradeInv( trade , region , year ) $ mTradeEac( trade , region , year )",
  vTradeEac = "vTradeEac( trade , region , year ) $ mTradeEac( trade , region , year )",
  vTradeNewCap = "vTradeNewCap( trade , year ) $ mTradeNew( trade , year )"
);