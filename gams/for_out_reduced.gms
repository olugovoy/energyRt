file vTechInv_csv / 'vTechInv.csv'/;
vTechInv_csv.lp = 1;
vTechInv_csv.nd = 1;
vTechInv_csv.nz = 1e-25;
vTechInv_csv.nr = 2;
put vTechInv_csv;
put "tech,region,year,value"/;
loop((tech,region,year)$(vTechInv.l(tech,region,year) and mMidMilestone(year)), put tech.tl:0",", region.tl:0",", year.tl:0","vTechInv.l(tech,region,year):0:15/;);
putclose; 
file vTechEac_csv / 'vTechEac.csv'/;
vTechEac_csv.lp = 1;
vTechEac_csv.nd = 1;
vTechEac_csv.nz = 1e-25;
vTechEac_csv.nr = 2;
put vTechEac_csv;
put "tech,region,year,value"/;
loop((tech,region,year)$(vTechEac.l(tech,region,year) and mMidMilestone(year)), put tech.tl:0",", region.tl:0",", year.tl:0","vTechEac.l(tech,region,year):0:15/;);
putclose; 
file vTechSalv_csv / 'vTechSalv.csv'/;
vTechSalv_csv.lp = 1;
vTechSalv_csv.nd = 1;
vTechSalv_csv.nz = 1e-25;
vTechSalv_csv.nr = 2;
put vTechSalv_csv;
put "tech,region,value"/;
loop((tech,region)$vTechSalv.l(tech,region), put tech.tl:0",", region.tl:0","vTechSalv.l(tech,region):0:15/;);
putclose; 
file vTechOMCost_csv / 'vTechOMCost.csv'/;
vTechOMCost_csv.lp = 1;
vTechOMCost_csv.nd = 1;
vTechOMCost_csv.nz = 1e-25;
vTechOMCost_csv.nr = 2;
put vTechOMCost_csv;
put "tech,region,year,value"/;
loop((tech,region,year)$(vTechOMCost.l(tech,region,year) and mMidMilestone(year)), put tech.tl:0",", region.tl:0",", year.tl:0","vTechOMCost.l(tech,region,year):0:15/;);
putclose; 
file vSupCost_csv / 'vSupCost.csv'/;
vSupCost_csv.lp = 1;
vSupCost_csv.nd = 1;
vSupCost_csv.nz = 1e-25;
vSupCost_csv.nr = 2;
put vSupCost_csv;
put "sup,region,year,value"/;
loop((sup,region,year)$(vSupCost.l(sup,region,year) and mMidMilestone(year)), put sup.tl:0",", region.tl:0",", year.tl:0","vSupCost.l(sup,region,year):0:15/;);
putclose; 
file vEmsFuelTot_csv / 'vEmsFuelTot.csv'/;
vEmsFuelTot_csv.lp = 1;
vEmsFuelTot_csv.nd = 1;
vEmsFuelTot_csv.nz = 1e-25;
vEmsFuelTot_csv.nr = 2;
put vEmsFuelTot_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vEmsFuelTot.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vEmsFuelTot.l(comm,region,year,slice):0:15/;);
putclose; 
file vTechEmsFuel_csv / 'vTechEmsFuel.csv'/;
vTechEmsFuel_csv.lp = 1;
vTechEmsFuel_csv.nd = 1;
vTechEmsFuel_csv.nz = 1e-25;
vTechEmsFuel_csv.nr = 2;
put vTechEmsFuel_csv;
put "tech,comm,region,year,slice,value"/;
loop((tech,comm,region,year,slice)$(vTechEmsFuel.l(tech,comm,region,year,slice) and mMidMilestone(year)), put tech.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vTechEmsFuel.l(tech,comm,region,year,slice):0:15/;);
putclose; 
file vBalance_csv / 'vBalance.csv'/;
vBalance_csv.lp = 1;
vBalance_csv.nd = 1;
vBalance_csv.nz = 1e-25;
vBalance_csv.nr = 2;
put vBalance_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vBalance.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vBalance.l(comm,region,year,slice):0:15/;);
putclose; 
file vCost_csv / 'vCost.csv'/;
vCost_csv.lp = 1;
vCost_csv.nd = 1;
vCost_csv.nz = 1e-25;
vCost_csv.nr = 2;
put vCost_csv;
put "region,year,value"/;
loop((region,year)$(vCost.l(region,year) and mMidMilestone(year)), put region.tl:0",", year.tl:0","vCost.l(region,year):0:15/;);
putclose; 
file vObjective_csv / 'vObjective.csv'/;
vObjective_csv.lp = 1;
vObjective_csv.nd = 1;
vObjective_csv.nz = 1e-25;
vObjective_csv.nr = 2;
put vObjective_csv;
put "value"/vObjective.l:0:15/;
putclose;
file vTaxCost_csv / 'vTaxCost.csv'/;
vTaxCost_csv.lp = 1;
vTaxCost_csv.nd = 1;
vTaxCost_csv.nz = 1e-25;
vTaxCost_csv.nr = 2;
put vTaxCost_csv;
put "comm,region,year,value"/;
loop((comm,region,year)$(vTaxCost.l(comm,region,year) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0","vTaxCost.l(comm,region,year):0:15/;);
putclose; 
file vSubsCost_csv / 'vSubsCost.csv'/;
vSubsCost_csv.lp = 1;
vSubsCost_csv.nd = 1;
vSubsCost_csv.nz = 1e-25;
vSubsCost_csv.nr = 2;
put vSubsCost_csv;
put "comm,region,year,value"/;
loop((comm,region,year)$(vSubsCost.l(comm,region,year) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0","vSubsCost.l(comm,region,year):0:15/;);
putclose; 
file vAggOut_csv / 'vAggOut.csv'/;
vAggOut_csv.lp = 1;
vAggOut_csv.nd = 1;
vAggOut_csv.nz = 1e-25;
vAggOut_csv.nr = 2;
put vAggOut_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vAggOut.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vAggOut.l(comm,region,year,slice):0:15/;);
putclose; 
file vStorageSalv_csv / 'vStorageSalv.csv'/;
vStorageSalv_csv.lp = 1;
vStorageSalv_csv.nd = 1;
vStorageSalv_csv.nz = 1e-25;
vStorageSalv_csv.nr = 2;
put vStorageSalv_csv;
put "stg,region,value"/;
loop((stg,region)$vStorageSalv.l(stg,region), put stg.tl:0",", region.tl:0","vStorageSalv.l(stg,region):0:15/;);
putclose; 
file vStorageCost_csv / 'vStorageCost.csv'/;
vStorageCost_csv.lp = 1;
vStorageCost_csv.nd = 1;
vStorageCost_csv.nz = 1e-25;
vStorageCost_csv.nr = 2;
put vStorageCost_csv;
put "stg,region,year,value"/;
loop((stg,region,year)$(vStorageCost.l(stg,region,year) and mMidMilestone(year)), put stg.tl:0",", region.tl:0",", year.tl:0","vStorageCost.l(stg,region,year):0:15/;);
putclose; 
file vTradeCost_csv / 'vTradeCost.csv'/;
vTradeCost_csv.lp = 1;
vTradeCost_csv.nd = 1;
vTradeCost_csv.nz = 1e-25;
vTradeCost_csv.nr = 2;
put vTradeCost_csv;
put "region,year,value"/;
loop((region,year)$(vTradeCost.l(region,year) and mMidMilestone(year)), put region.tl:0",", year.tl:0","vTradeCost.l(region,year):0:15/;);
putclose; 
file vTradeRowCost_csv / 'vTradeRowCost.csv'/;
vTradeRowCost_csv.lp = 1;
vTradeRowCost_csv.nd = 1;
vTradeRowCost_csv.nz = 1e-25;
vTradeRowCost_csv.nr = 2;
put vTradeRowCost_csv;
put "region,year,value"/;
loop((region,year)$(vTradeRowCost.l(region,year) and mMidMilestone(year)), put region.tl:0",", year.tl:0","vTradeRowCost.l(region,year):0:15/;);
putclose; 
file vTradeIrCost_csv / 'vTradeIrCost.csv'/;
vTradeIrCost_csv.lp = 1;
vTradeIrCost_csv.nd = 1;
vTradeIrCost_csv.nz = 1e-25;
vTradeIrCost_csv.nr = 2;
put vTradeIrCost_csv;
put "region,year,value"/;
loop((region,year)$(vTradeIrCost.l(region,year) and mMidMilestone(year)), put region.tl:0",", year.tl:0","vTradeIrCost.l(region,year):0:15/;);
putclose; 
file vTechUse_csv / 'vTechUse.csv'/;
vTechUse_csv.lp = 1;
vTechUse_csv.nd = 1;
vTechUse_csv.nz = 1e-25;
vTechUse_csv.nr = 2;
put vTechUse_csv;
put "tech,region,year,slice,value"/;
loop((tech,region,year,slice)$(vTechUse.l(tech,region,year,slice) and mMidMilestone(year)), put tech.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vTechUse.l(tech,region,year,slice):0:15/;);
putclose; 
file vTechNewCap_csv / 'vTechNewCap.csv'/;
vTechNewCap_csv.lp = 1;
vTechNewCap_csv.nd = 1;
vTechNewCap_csv.nz = 1e-25;
vTechNewCap_csv.nr = 2;
put vTechNewCap_csv;
put "tech,region,year,value"/;
loop((tech,region,year)$(vTechNewCap.l(tech,region,year) and mMidMilestone(year)), put tech.tl:0",", region.tl:0",", year.tl:0","vTechNewCap.l(tech,region,year):0:15/;);
putclose; 
file vTechRetiredCap_csv / 'vTechRetiredCap.csv'/;
vTechRetiredCap_csv.lp = 1;
vTechRetiredCap_csv.nd = 1;
vTechRetiredCap_csv.nz = 1e-25;
vTechRetiredCap_csv.nr = 2;
put vTechRetiredCap_csv;
put "tech,region,year,yearp,value"/;
loop((tech,region,year,yearp)$(vTechRetiredCap.l(tech,region,year,yearp) and mMidMilestone(year)), put tech.tl:0",", region.tl:0",", year.tl:0",", yearp.tl:0","vTechRetiredCap.l(tech,region,year,yearp):0:15/;);
putclose; 
file vTechCap_csv / 'vTechCap.csv'/;
vTechCap_csv.lp = 1;
vTechCap_csv.nd = 1;
vTechCap_csv.nz = 1e-25;
vTechCap_csv.nr = 2;
put vTechCap_csv;
put "tech,region,year,value"/;
loop((tech,region,year)$(vTechCap.l(tech,region,year) and mMidMilestone(year)), put tech.tl:0",", region.tl:0",", year.tl:0","vTechCap.l(tech,region,year):0:15/;);
putclose; 
file vTechAct_csv / 'vTechAct.csv'/;
vTechAct_csv.lp = 1;
vTechAct_csv.nd = 1;
vTechAct_csv.nz = 1e-25;
vTechAct_csv.nr = 2;
put vTechAct_csv;
put "tech,region,year,slice,value"/;
loop((tech,region,year,slice)$(vTechAct.l(tech,region,year,slice) and mMidMilestone(year)), put tech.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vTechAct.l(tech,region,year,slice):0:15/;);
putclose; 
file vTechInp_csv / 'vTechInp.csv'/;
vTechInp_csv.lp = 1;
vTechInp_csv.nd = 1;
vTechInp_csv.nz = 1e-25;
vTechInp_csv.nr = 2;
put vTechInp_csv;
put "tech,comm,region,year,slice,value"/;
loop((tech,comm,region,year,slice)$(vTechInp.l(tech,comm,region,year,slice) and mMidMilestone(year)), put tech.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vTechInp.l(tech,comm,region,year,slice):0:15/;);
putclose; 
file vTechOut_csv / 'vTechOut.csv'/;
vTechOut_csv.lp = 1;
vTechOut_csv.nd = 1;
vTechOut_csv.nz = 1e-25;
vTechOut_csv.nr = 2;
put vTechOut_csv;
put "tech,comm,region,year,slice,value"/;
loop((tech,comm,region,year,slice)$(vTechOut.l(tech,comm,region,year,slice) and mMidMilestone(year)), put tech.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vTechOut.l(tech,comm,region,year,slice):0:15/;);
putclose; 
file vTechAInp_csv / 'vTechAInp.csv'/;
vTechAInp_csv.lp = 1;
vTechAInp_csv.nd = 1;
vTechAInp_csv.nz = 1e-25;
vTechAInp_csv.nr = 2;
put vTechAInp_csv;
put "tech,comm,region,year,slice,value"/;
loop((tech,comm,region,year,slice)$(vTechAInp.l(tech,comm,region,year,slice) and mMidMilestone(year)), put tech.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vTechAInp.l(tech,comm,region,year,slice):0:15/;);
putclose; 
file vTechAOut_csv / 'vTechAOut.csv'/;
vTechAOut_csv.lp = 1;
vTechAOut_csv.nd = 1;
vTechAOut_csv.nz = 1e-25;
vTechAOut_csv.nr = 2;
put vTechAOut_csv;
put "tech,comm,region,year,slice,value"/;
loop((tech,comm,region,year,slice)$(vTechAOut.l(tech,comm,region,year,slice) and mMidMilestone(year)), put tech.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vTechAOut.l(tech,comm,region,year,slice):0:15/;);
putclose; 
file vSupOut_csv / 'vSupOut.csv'/;
vSupOut_csv.lp = 1;
vSupOut_csv.nd = 1;
vSupOut_csv.nz = 1e-25;
vSupOut_csv.nr = 2;
put vSupOut_csv;
put "sup,comm,region,year,slice,value"/;
loop((sup,comm,region,year,slice)$(vSupOut.l(sup,comm,region,year,slice) and mMidMilestone(year)), put sup.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vSupOut.l(sup,comm,region,year,slice):0:15/;);
putclose; 
file vSupReserve_csv / 'vSupReserve.csv'/;
vSupReserve_csv.lp = 1;
vSupReserve_csv.nd = 1;
vSupReserve_csv.nz = 1e-25;
vSupReserve_csv.nr = 2;
put vSupReserve_csv;
put "sup,comm,region,value"/;
loop((sup,comm,region)$vSupReserve.l(sup,comm,region), put sup.tl:0",", comm.tl:0",", region.tl:0","vSupReserve.l(sup,comm,region):0:15/;);
putclose; 
file vDemInp_csv / 'vDemInp.csv'/;
vDemInp_csv.lp = 1;
vDemInp_csv.nd = 1;
vDemInp_csv.nz = 1e-25;
vDemInp_csv.nr = 2;
put vDemInp_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vDemInp.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vDemInp.l(comm,region,year,slice):0:15/;);
putclose; 
file vOutTot_csv / 'vOutTot.csv'/;
vOutTot_csv.lp = 1;
vOutTot_csv.nd = 1;
vOutTot_csv.nz = 1e-25;
vOutTot_csv.nr = 2;
put vOutTot_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vOutTot.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vOutTot.l(comm,region,year,slice):0:15/;);
putclose; 
file vInpTot_csv / 'vInpTot.csv'/;
vInpTot_csv.lp = 1;
vInpTot_csv.nd = 1;
vInpTot_csv.nz = 1e-25;
vInpTot_csv.nr = 2;
put vInpTot_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vInpTot.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vInpTot.l(comm,region,year,slice):0:15/;);
putclose; 
file vInp2Lo_csv / 'vInp2Lo.csv'/;
vInp2Lo_csv.lp = 1;
vInp2Lo_csv.nd = 1;
vInp2Lo_csv.nz = 1e-25;
vInp2Lo_csv.nr = 2;
put vInp2Lo_csv;
put "comm,region,year,slicep,slice,value"/;
loop((comm,region,year,slicep,slice)$(vInp2Lo.l(comm,region,year,slicep,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slicep.tl:0",", slice.tl:0","vInp2Lo.l(comm,region,year,slicep,slice):0:15/;);
putclose; 
file vOut2Lo_csv / 'vOut2Lo.csv'/;
vOut2Lo_csv.lp = 1;
vOut2Lo_csv.nd = 1;
vOut2Lo_csv.nz = 1e-25;
vOut2Lo_csv.nr = 2;
put vOut2Lo_csv;
put "comm,region,year,slicep,slice,value"/;
loop((comm,region,year,slicep,slice)$(vOut2Lo.l(comm,region,year,slicep,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slicep.tl:0",", slice.tl:0","vOut2Lo.l(comm,region,year,slicep,slice):0:15/;);
putclose; 
file vSupOutTot_csv / 'vSupOutTot.csv'/;
vSupOutTot_csv.lp = 1;
vSupOutTot_csv.nd = 1;
vSupOutTot_csv.nz = 1e-25;
vSupOutTot_csv.nr = 2;
put vSupOutTot_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vSupOutTot.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vSupOutTot.l(comm,region,year,slice):0:15/;);
putclose; 
file vTechInpTot_csv / 'vTechInpTot.csv'/;
vTechInpTot_csv.lp = 1;
vTechInpTot_csv.nd = 1;
vTechInpTot_csv.nz = 1e-25;
vTechInpTot_csv.nr = 2;
put vTechInpTot_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vTechInpTot.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vTechInpTot.l(comm,region,year,slice):0:15/;);
putclose; 
file vTechOutTot_csv / 'vTechOutTot.csv'/;
vTechOutTot_csv.lp = 1;
vTechOutTot_csv.nd = 1;
vTechOutTot_csv.nz = 1e-25;
vTechOutTot_csv.nr = 2;
put vTechOutTot_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vTechOutTot.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vTechOutTot.l(comm,region,year,slice):0:15/;);
putclose; 
file vStorageInpTot_csv / 'vStorageInpTot.csv'/;
vStorageInpTot_csv.lp = 1;
vStorageInpTot_csv.nd = 1;
vStorageInpTot_csv.nz = 1e-25;
vStorageInpTot_csv.nr = 2;
put vStorageInpTot_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vStorageInpTot.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vStorageInpTot.l(comm,region,year,slice):0:15/;);
putclose; 
file vStorageOutTot_csv / 'vStorageOutTot.csv'/;
vStorageOutTot_csv.lp = 1;
vStorageOutTot_csv.nd = 1;
vStorageOutTot_csv.nz = 1e-25;
vStorageOutTot_csv.nr = 2;
put vStorageOutTot_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vStorageOutTot.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vStorageOutTot.l(comm,region,year,slice):0:15/;);
putclose; 
file vStorageAInp_csv / 'vStorageAInp.csv'/;
vStorageAInp_csv.lp = 1;
vStorageAInp_csv.nd = 1;
vStorageAInp_csv.nz = 1e-25;
vStorageAInp_csv.nr = 2;
put vStorageAInp_csv;
put "stg,comm,region,year,slice,value"/;
loop((stg,comm,region,year,slice)$(vStorageAInp.l(stg,comm,region,year,slice) and mMidMilestone(year)), put stg.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vStorageAInp.l(stg,comm,region,year,slice):0:15/;);
putclose; 
file vStorageAOut_csv / 'vStorageAOut.csv'/;
vStorageAOut_csv.lp = 1;
vStorageAOut_csv.nd = 1;
vStorageAOut_csv.nz = 1e-25;
vStorageAOut_csv.nr = 2;
put vStorageAOut_csv;
put "stg,comm,region,year,slice,value"/;
loop((stg,comm,region,year,slice)$(vStorageAOut.l(stg,comm,region,year,slice) and mMidMilestone(year)), put stg.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vStorageAOut.l(stg,comm,region,year,slice):0:15/;);
putclose; 
file vDummyImport_csv / 'vDummyImport.csv'/;
vDummyImport_csv.lp = 1;
vDummyImport_csv.nd = 1;
vDummyImport_csv.nz = 1e-25;
vDummyImport_csv.nr = 2;
put vDummyImport_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vDummyImport.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vDummyImport.l(comm,region,year,slice):0:15/;);
putclose; 
file vDummyExport_csv / 'vDummyExport.csv'/;
vDummyExport_csv.lp = 1;
vDummyExport_csv.nd = 1;
vDummyExport_csv.nz = 1e-25;
vDummyExport_csv.nr = 2;
put vDummyExport_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vDummyExport.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vDummyExport.l(comm,region,year,slice):0:15/;);
putclose; 
file vDummyCost_csv / 'vDummyCost.csv'/;
vDummyCost_csv.lp = 1;
vDummyCost_csv.nd = 1;
vDummyCost_csv.nz = 1e-25;
vDummyCost_csv.nr = 2;
put vDummyCost_csv;
put "comm,region,year,value"/;
loop((comm,region,year)$(vDummyCost.l(comm,region,year) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0","vDummyCost.l(comm,region,year):0:15/;);
putclose; 
file vStorageInp_csv / 'vStorageInp.csv'/;
vStorageInp_csv.lp = 1;
vStorageInp_csv.nd = 1;
vStorageInp_csv.nz = 1e-25;
vStorageInp_csv.nr = 2;
put vStorageInp_csv;
put "stg,comm,region,year,slice,value"/;
loop((stg,comm,region,year,slice)$(vStorageInp.l(stg,comm,region,year,slice) and mMidMilestone(year)), put stg.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vStorageInp.l(stg,comm,region,year,slice):0:15/;);
putclose; 
file vStorageOut_csv / 'vStorageOut.csv'/;
vStorageOut_csv.lp = 1;
vStorageOut_csv.nd = 1;
vStorageOut_csv.nz = 1e-25;
vStorageOut_csv.nr = 2;
put vStorageOut_csv;
put "stg,comm,region,year,slice,value"/;
loop((stg,comm,region,year,slice)$(vStorageOut.l(stg,comm,region,year,slice) and mMidMilestone(year)), put stg.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vStorageOut.l(stg,comm,region,year,slice):0:15/;);
putclose; 
file vStorageStore_csv / 'vStorageStore.csv'/;
vStorageStore_csv.lp = 1;
vStorageStore_csv.nd = 1;
vStorageStore_csv.nz = 1e-25;
vStorageStore_csv.nr = 2;
put vStorageStore_csv;
put "stg,comm,region,year,slice,value"/;
loop((stg,comm,region,year,slice)$(vStorageStore.l(stg,comm,region,year,slice) and mMidMilestone(year)), put stg.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vStorageStore.l(stg,comm,region,year,slice):0:15/;);
putclose; 
file vStorageInv_csv / 'vStorageInv.csv'/;
vStorageInv_csv.lp = 1;
vStorageInv_csv.nd = 1;
vStorageInv_csv.nz = 1e-25;
vStorageInv_csv.nr = 2;
put vStorageInv_csv;
put "stg,region,year,value"/;
loop((stg,region,year)$(vStorageInv.l(stg,region,year) and mMidMilestone(year)), put stg.tl:0",", region.tl:0",", year.tl:0","vStorageInv.l(stg,region,year):0:15/;);
putclose; 
file vStorageCap_csv / 'vStorageCap.csv'/;
vStorageCap_csv.lp = 1;
vStorageCap_csv.nd = 1;
vStorageCap_csv.nz = 1e-25;
vStorageCap_csv.nr = 2;
put vStorageCap_csv;
put "stg,region,year,value"/;
loop((stg,region,year)$(vStorageCap.l(stg,region,year) and mMidMilestone(year)), put stg.tl:0",", region.tl:0",", year.tl:0","vStorageCap.l(stg,region,year):0:15/;);
putclose; 
file vStorageNewCap_csv / 'vStorageNewCap.csv'/;
vStorageNewCap_csv.lp = 1;
vStorageNewCap_csv.nd = 1;
vStorageNewCap_csv.nz = 1e-25;
vStorageNewCap_csv.nr = 2;
put vStorageNewCap_csv;
put "stg,region,year,value"/;
loop((stg,region,year)$(vStorageNewCap.l(stg,region,year) and mMidMilestone(year)), put stg.tl:0",", region.tl:0",", year.tl:0","vStorageNewCap.l(stg,region,year):0:15/;);
putclose; 
file vImport_csv / 'vImport.csv'/;
vImport_csv.lp = 1;
vImport_csv.nd = 1;
vImport_csv.nz = 1e-25;
vImport_csv.nr = 2;
put vImport_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vImport.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vImport.l(comm,region,year,slice):0:15/;);
putclose; 
file vExport_csv / 'vExport.csv'/;
vExport_csv.lp = 1;
vExport_csv.nd = 1;
vExport_csv.nz = 1e-25;
vExport_csv.nr = 2;
put vExport_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vExport.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vExport.l(comm,region,year,slice):0:15/;);
putclose; 
file vTradeIr_csv / 'vTradeIr.csv'/;
vTradeIr_csv.lp = 1;
vTradeIr_csv.nd = 1;
vTradeIr_csv.nz = 1e-25;
vTradeIr_csv.nr = 2;
put vTradeIr_csv;
put "trade,comm,src,dst,year,slice,value"/;
loop((trade,comm,region,regionp,year,slice)$(vTradeIr.l(trade,comm,region,regionp,year,slice) and mMidMilestone(year)), put trade.tl:0",", comm.tl:0",", region.tl:0",", regionp.tl:0",", year.tl:0",", slice.tl:0","vTradeIr.l(trade,comm,region,regionp,year,slice):0:15/;);
putclose; 
file vTradeIrAInp_csv / 'vTradeIrAInp.csv'/;
vTradeIrAInp_csv.lp = 1;
vTradeIrAInp_csv.nd = 1;
vTradeIrAInp_csv.nz = 1e-25;
vTradeIrAInp_csv.nr = 2;
put vTradeIrAInp_csv;
put "trade,comm,region,year,slice,value"/;
loop((trade,comm,region,year,slice)$(vTradeIrAInp.l(trade,comm,region,year,slice) and mMidMilestone(year)), put trade.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vTradeIrAInp.l(trade,comm,region,year,slice):0:15/;);
putclose; 
file vTradeIrAInpTot_csv / 'vTradeIrAInpTot.csv'/;
vTradeIrAInpTot_csv.lp = 1;
vTradeIrAInpTot_csv.nd = 1;
vTradeIrAInpTot_csv.nz = 1e-25;
vTradeIrAInpTot_csv.nr = 2;
put vTradeIrAInpTot_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vTradeIrAInpTot.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vTradeIrAInpTot.l(comm,region,year,slice):0:15/;);
putclose; 
file vTradeIrAOut_csv / 'vTradeIrAOut.csv'/;
vTradeIrAOut_csv.lp = 1;
vTradeIrAOut_csv.nd = 1;
vTradeIrAOut_csv.nz = 1e-25;
vTradeIrAOut_csv.nr = 2;
put vTradeIrAOut_csv;
put "trade,comm,region,year,slice,value"/;
loop((trade,comm,region,year,slice)$(vTradeIrAOut.l(trade,comm,region,year,slice) and mMidMilestone(year)), put trade.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vTradeIrAOut.l(trade,comm,region,year,slice):0:15/;);
putclose; 
file vTradeIrAOutTot_csv / 'vTradeIrAOutTot.csv'/;
vTradeIrAOutTot_csv.lp = 1;
vTradeIrAOutTot_csv.nd = 1;
vTradeIrAOutTot_csv.nz = 1e-25;
vTradeIrAOutTot_csv.nr = 2;
put vTradeIrAOutTot_csv;
put "comm,region,year,slice,value"/;
loop((comm,region,year,slice)$(vTradeIrAOutTot.l(comm,region,year,slice) and mMidMilestone(year)), put comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vTradeIrAOutTot.l(comm,region,year,slice):0:15/;);
putclose; 
file vExportRowAccumulated_csv / 'vExportRowAccumulated.csv'/;
vExportRowAccumulated_csv.lp = 1;
vExportRowAccumulated_csv.nd = 1;
vExportRowAccumulated_csv.nz = 1e-25;
vExportRowAccumulated_csv.nr = 2;
put vExportRowAccumulated_csv;
put "expp,comm,value"/;
loop((expp,comm)$vExportRowAccumulated.l(expp,comm), put expp.tl:0",", comm.tl:0","vExportRowAccumulated.l(expp,comm):0:15/;);
putclose; 
file vExportRow_csv / 'vExportRow.csv'/;
vExportRow_csv.lp = 1;
vExportRow_csv.nd = 1;
vExportRow_csv.nz = 1e-25;
vExportRow_csv.nr = 2;
put vExportRow_csv;
put "expp,comm,region,year,slice,value"/;
loop((expp,comm,region,year,slice)$(vExportRow.l(expp,comm,region,year,slice) and mMidMilestone(year)), put expp.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vExportRow.l(expp,comm,region,year,slice):0:15/;);
putclose; 
file vImportRowAccumulated_csv / 'vImportRowAccumulated.csv'/;
vImportRowAccumulated_csv.lp = 1;
vImportRowAccumulated_csv.nd = 1;
vImportRowAccumulated_csv.nz = 1e-25;
vImportRowAccumulated_csv.nr = 2;
put vImportRowAccumulated_csv;
put "imp,comm,value"/;
loop((imp,comm)$vImportRowAccumulated.l(imp,comm), put imp.tl:0",", comm.tl:0","vImportRowAccumulated.l(imp,comm):0:15/;);
putclose; 
file vImportRow_csv / 'vImportRow.csv'/;
vImportRow_csv.lp = 1;
vImportRow_csv.nd = 1;
vImportRow_csv.nz = 1e-25;
vImportRow_csv.nr = 2;
put vImportRow_csv;
put "imp,comm,region,year,slice,value"/;
loop((imp,comm,region,year,slice)$(vImportRow.l(imp,comm,region,year,slice) and mMidMilestone(year)), put imp.tl:0",", comm.tl:0",", region.tl:0",", year.tl:0",", slice.tl:0","vImportRow.l(imp,comm,region,year,slice):0:15/;);
putclose; 
file variable_list_csv / 'variable_list.csv'/;
variable_list_csv.lp = 1;
put variable_list_csv;
    put "value"/;
    put "vTechInv"/;
    put "vTechEac"/;
    put "vTechSalv"/;
    put "vTechOMCost"/;
    put "vSupCost"/;
    put "vEmsFuelTot"/;
    put "vTechEmsFuel"/;
    put "vBalance"/;
    put "vCost"/;
    put "vObjective"/;
    put "vTaxCost"/;
    put "vSubsCost"/;
    put "vAggOut"/;
    put "vStorageSalv"/;
    put "vStorageCost"/;
    put "vTradeCost"/;
    put "vTradeRowCost"/;
    put "vTradeIrCost"/;
    put "vTechUse"/;
    put "vTechNewCap"/;
    put "vTechRetiredCap"/;
    put "vTechCap"/;
    put "vTechAct"/;
    put "vTechInp"/;
    put "vTechOut"/;
    put "vTechAInp"/;
    put "vTechAOut"/;
    put "vSupOut"/;
    put "vSupReserve"/;
    put "vDemInp"/;
    put "vOutTot"/;
    put "vInpTot"/;
    put "vInp2Lo"/;
    put "vOut2Lo"/;
    put "vSupOutTot"/;
    put "vTechInpTot"/;
    put "vTechOutTot"/;
    put "vStorageInpTot"/;
    put "vStorageOutTot"/;
    put "vStorageAInp"/;
    put "vStorageAOut"/;
    put "vDummyImport"/;
    put "vDummyExport"/;
    put "vDummyCost"/;
    put "vStorageInp"/;
    put "vStorageOut"/;
    put "vStorageStore"/;
    put "vStorageInv"/;
    put "vStorageCap"/;
    put "vStorageNewCap"/;
    put "vImport"/;
    put "vExport"/;
    put "vTradeIr"/;
    put "vTradeIrAInp"/;
    put "vTradeIrAInpTot"/;
    put "vTradeIrAOut"/;
    put "vTradeIrAOutTot"/;
    put "vExportRowAccumulated"/;
    put "vExportRow"/;
    put "vImportRowAccumulated"/;
    put "vImportRow"/;
 putclose;
file raw_data_set_csv / 'raw_data_set.csv'/;
raw_data_set_csv.lp = 1;
put raw_data_set_csv;
put "set,value"/;
loop(tech, put "tech,"tech.tl:0/;);
loop(sup, put "sup,"sup.tl:0/;);
loop(dem, put "dem,"dem.tl:0/;);
loop(stg, put "stg,"stg.tl:0/;);
loop(expp, put "expp,"expp.tl:0/;);
loop(imp, put "imp,"imp.tl:0/;);
loop(trade, put "trade,"trade.tl:0/;);
loop(group, put "group,"group.tl:0/;);
loop(comm, put "comm,"comm.tl:0/;);
loop(region, put "region,"region.tl:0/;);
loop(year$mMidMilestone(year), put "year,"year.tl:0/;);
loop(slice, put "slice,"slice.tl:0/;);
loop(weather, put "weather,"weather.tl:0/;);
loop(cns, put "cns,"cns.tl:0/;);
putclose;
