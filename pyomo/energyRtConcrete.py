verbose = True
import datetime
print("start time: " + str(datetime.datetime.now().strftime("%H:%M:%S")) + "\n")
flog = open('output/log.csv', 'w')
flog.write('parameter,value,time\n')
flog.write('"model language",PyomoConcrete,"' + str(datetime.datetime.now().strftime("%H:%M:%S")) + '"\n')
flog.write('"load data",,"' + str(datetime.datetime.now().strftime("%H:%M:%S")) + '"\n')
import time
seconds = time.time()
import itertools
from pyomo.environ import *
from pyomo.opt import SolverFactory
import pyomo.environ as pyo
class toPar:
    def __init__(self, val, default):
        self.default = default
        self.val = val
    def get(self, key):
        if key in self.val:
            return (self.val[key])
        return (self.default)
exec(open("inc1.py").read())
model = ConcreteModel()
import pandas as pd
import sqlite3
con = sqlite3.connect("input/data.db")
def read_set(name):
    tbl = pd.read_sql_query("SELECT * from " + name, con)
    if tbl.shape[1] > 1:
        return tbl.to_records(index=False).tolist()
    else:
        return list(tbl.iloc[:,0])
def read_dict(name):
    tbl = pd.read_sql_query("SELECT * from " + name, con)
    if tbl.shape[1] > 2:
        idx = pd.MultiIndex.from_frame(tbl.drop(columns = "value"))
    else:
        idx = tbl.iloc[:,0].tolist()
    tbl = pd.DataFrame(tbl.value.tolist(), index = idx, columns = ["value"])
    return tbl.to_dict()["value"]
##### decl par #####
print("variables... " + str(datetime.datetime.now().strftime("%H:%M:%S")) + " (" + str(round(time.time() - seconds, 2)) + " s)")
model.vTechInv = Var(mTechInv, doc = "Overnight investment costs");
model.vTechEac = Var(mTechEac, doc = "Annualized investment costs");
model.vTechOMCost = Var(mTechOMCost, doc = "Sum of all operational costs is equal vTechFixom + vTechVarom (AVarom + CVarom + ActVarom)");
model.vSupCost = Var(mvSupCost, doc = "Supply costs");
model.vEmsFuelTot = Var(mEmsFuelTot, doc = "Total fuel emissions");
model.vBalance = Var(mvBalance, doc = "Net commodity balance");
model.vTotalCost = Var(mvTotalCost, doc = "Regional annual total costs");
model.vObjective = Var(doc = "Objective costs");
model.vTaxCost = Var(mTaxCost, doc = "Total tax levies (tax costs)");
model.vSubsCost = Var(mSubCost, doc = "Total subsidies (for substraction from costs)");
model.vAggOut = Var(mAggOut, doc = "Aggregated commodity output");
model.vStorageOMCost = Var(mStorageOMCost, doc = "Storage O&M costs");
model.vTradeCost = Var(mvTradeCost, doc = "Total trade costs");
model.vTradeRowCost = Var(mvTradeRowCost, doc = "Trade with ROW costs");
model.vTradeIrCost = Var(mvTradeIrCost, doc = "Interregional trade costs");
model.vTechNewCap = Var(mTechNew, domain = pyo.NonNegativeReals, doc = "New capacity");
model.vTechRetiredStock = Var(mvTechRetiredStock, domain = pyo.NonNegativeReals, doc = "Early retired capacity");
model.vTechRetiredNewCap = Var(mvTechRetiredNewCap, domain = pyo.NonNegativeReals, doc = "Early retired capacity");
model.vTechCap = Var(mTechSpan, domain = pyo.NonNegativeReals, doc = "Total capacity of the technology");
model.vTechAct = Var(mvTechAct, domain = pyo.NonNegativeReals, doc = "Activity level of technology");
model.vTechInp = Var(mvTechInp, domain = pyo.NonNegativeReals, doc = "Input level");
model.vTechOut = Var(mvTechOut, domain = pyo.NonNegativeReals, doc = "Output level");
model.vTechAInp = Var(mvTechAInp, domain = pyo.NonNegativeReals, doc = "Auxiliary commodity input");
model.vTechAOut = Var(mvTechAOut, domain = pyo.NonNegativeReals, doc = "Auxiliary commodity output");
model.vSupOut = Var(mSupAva, domain = pyo.NonNegativeReals, doc = "Output of supply");
model.vSupReserve = Var(mvSupReserve, domain = pyo.NonNegativeReals, doc = "Total supply reserve");
model.vDemInp = Var(mvDemInp, domain = pyo.NonNegativeReals, doc = "Input to demand");
model.vOutTot = Var(mvOutTot, domain = pyo.NonNegativeReals, doc = "Total commodity output (consumption is not counted)");
model.vInpTot = Var(mvInpTot, domain = pyo.NonNegativeReals, doc = "Total commodity input");
model.vInp2Lo = Var(mvInp2Lo, domain = pyo.NonNegativeReals, doc = "Desagregation of slices for input parent to (grand)child");
model.vOut2Lo = Var(mvOut2Lo, domain = pyo.NonNegativeReals, doc = "Desagregation of slices for output parent to (grand)child");
model.vSupOutTot = Var(mSupOutTot, domain = pyo.NonNegativeReals, doc = "Total commodity supply");
model.vTechInpTot = Var(mTechInpTot, domain = pyo.NonNegativeReals, doc = "Total commodity input to technologies");
model.vTechOutTot = Var(mTechOutTot, domain = pyo.NonNegativeReals, doc = "Total commodity output from technologies");
model.vStorageInpTot = Var(mStorageInpTot, domain = pyo.NonNegativeReals, doc = "Total commodity input to storages");
model.vStorageOutTot = Var(mStorageOutTot, domain = pyo.NonNegativeReals, doc = "Total commodity output from storages");
model.vStorageAInp = Var(mvStorageAInp, domain = pyo.NonNegativeReals, doc = "Aux-commodity input to storage");
model.vStorageAOut = Var(mvStorageAOut, domain = pyo.NonNegativeReals, doc = "Aux-commodity input from storage");
model.vDummyImport = Var(mDummyImport, domain = pyo.NonNegativeReals, doc = "Dummy import (for debugging)");
model.vDummyExport = Var(mDummyExport, domain = pyo.NonNegativeReals, doc = "Dummy export (for debugging)");
model.vStorageInp = Var(mvStorageStore, domain = pyo.NonNegativeReals, doc = "Storage input");
model.vStorageOut = Var(mvStorageStore, domain = pyo.NonNegativeReals, doc = "Storage output");
model.vStorageStore = Var(mvStorageStore, domain = pyo.NonNegativeReals, doc = "Storage accumulated level");
model.vStorageInv = Var(mStorageNew, domain = pyo.NonNegativeReals, doc = "Storage technology investments");
model.vStorageEac = Var(mStorageEac, domain = pyo.NonNegativeReals, doc = "Storage technology EAC investments");
model.vStorageCap = Var(mStorageSpan, domain = pyo.NonNegativeReals, doc = "Storage capacity");
model.vStorageNewCap = Var(mStorageNew, domain = pyo.NonNegativeReals, doc = "Storage new capacity");
model.vImport = Var(mImport, domain = pyo.NonNegativeReals, doc = "Total regional import (Ir + ROW)");
model.vExport = Var(mExport, domain = pyo.NonNegativeReals, doc = "Total regional export (Ir + ROW)");
model.vTradeIr = Var(mvTradeIr, domain = pyo.NonNegativeReals, doc = "Total physical trade flows between regions");
model.vTradeIrAInp = Var(mvTradeIrAInp, domain = pyo.NonNegativeReals, doc = "Trade auxilari input");
model.vTradeIrAInpTot = Var(mvTradeIrAInpTot, domain = pyo.NonNegativeReals, doc = "Trade total auxilari input");
model.vTradeIrAOut = Var(mvTradeIrAOut, domain = pyo.NonNegativeReals, doc = "Trade auxilari output");
model.vTradeIrAOutTot = Var(mvTradeIrAOutTot, domain = pyo.NonNegativeReals, doc = "Trade auxilari output");
model.vExportRowAccumulated = Var(mExpComm, domain = pyo.NonNegativeReals, doc = "Accumulated export to ROW");
model.vExportRow = Var(mExportRow, domain = pyo.NonNegativeReals, doc = "Export to ROW");
model.vImportRowAccumulated = Var(mImpComm, domain = pyo.NonNegativeReals, doc = "Accumulated import from ROW");
model.vImportRow = Var(mImportRow, domain = pyo.NonNegativeReals, doc = "Import from ROW");
model.vTradeCap = Var(mTradeSpan, domain = pyo.NonNegativeReals, doc = "");
model.vTradeInv = Var(mTradeEac, domain = pyo.NonNegativeReals, doc = "");
model.vTradeEac = Var(mTradeEac, domain = pyo.NonNegativeReals, doc = "");
model.vTradeNewCap = Var(mTradeNew, domain = pyo.NonNegativeReals, doc = "");
model.vTotalUserCosts = Var(mvTotalUserCosts, domain = pyo.NonNegativeReals, doc = "");
exec(open("inc2.py").read())
print("equations... " + str(datetime.datetime.now().strftime("%H:%M:%S")) + " (" + str(round(time.time() - seconds, 2)) + " s)")
if verbose: print("eqTechSng2Sng ", end = "")
# eqTechSng2Sng(tech, region, comm, commp, year, slice)$meqTechSng2Sng(tech, region, comm, commp, year, slice)
model.eqTechSng2Sng = Constraint(meqTechSng2Sng, rule = lambda model, t, r, c, cp, y, s : model.vTechInp[t,c,r,y,s]*pTechCinp2use.get((t,c,r,y,s))  ==  (model.vTechOut[t,cp,r,y,s]) / (pTechUse2cact.get((t,cp,r,y,s))*pTechCact2cout.get((t,cp,r,y,s))));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechGrp2Sng ", end = "")
# eqTechGrp2Sng(tech, region, group, commp, year, slice)$meqTechGrp2Sng(tech, region, group, commp, year, slice)
model.eqTechGrp2Sng = Constraint(meqTechGrp2Sng, rule = lambda model, t, r, g, cp, y, s : pTechGinp2use.get((t,g,r,y,s))*sum(((model.vTechInp[t,c,r,y,s]*pTechCinp2ginp.get((t,c,r,y,s))) if (t,c,r,y,s) in mvTechInp else 0) for c in comm if (t,g,c) in mTechGroupComm)  ==  (model.vTechOut[t,cp,r,y,s]) / (pTechUse2cact.get((t,cp,r,y,s))*pTechCact2cout.get((t,cp,r,y,s))));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechSng2Grp ", end = "")
# eqTechSng2Grp(tech, region, comm, groupp, year, slice)$meqTechSng2Grp(tech, region, comm, groupp, year, slice)
model.eqTechSng2Grp = Constraint(meqTechSng2Grp, rule = lambda model, t, r, c, gp, y, s : model.vTechInp[t,c,r,y,s]*pTechCinp2use.get((t,c,r,y,s))  ==  sum((((model.vTechOut[t,cp,r,y,s]) / (pTechUse2cact.get((t,cp,r,y,s))*pTechCact2cout.get((t,cp,r,y,s)))) if (t,cp,r,y,s) in mvTechOut else 0) for cp in comm if (t,gp,cp) in mTechGroupComm));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechGrp2Grp ", end = "")
# eqTechGrp2Grp(tech, region, group, groupp, year, slice)$meqTechGrp2Grp(tech, region, group, groupp, year, slice)
model.eqTechGrp2Grp = Constraint(meqTechGrp2Grp, rule = lambda model, t, r, g, gp, y, s : pTechGinp2use.get((t,g,r,y,s))*sum(((model.vTechInp[t,c,r,y,s]*pTechCinp2ginp.get((t,c,r,y,s))) if (t,c,r,y,s) in mvTechInp else 0) for c in comm if (t,g,c) in mTechGroupComm)  ==  sum((((model.vTechOut[t,cp,r,y,s]) / (pTechUse2cact.get((t,cp,r,y,s))*pTechCact2cout.get((t,cp,r,y,s)))) if (t,cp,r,y,s) in mvTechOut else 0) for cp in comm if (t,gp,cp) in mTechGroupComm));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechShareInpLo ", end = "")
# eqTechShareInpLo(tech, region, group, comm, year, slice)$meqTechShareInpLo(tech, region, group, comm, year, slice)
model.eqTechShareInpLo = Constraint(meqTechShareInpLo, rule = lambda model, t, r, g, c, y, s : model.vTechInp[t,c,r,y,s]  >=  pTechShareLo.get((t,c,r,y,s))*sum((model.vTechInp[t,cp,r,y,s] if (t,cp,r,y,s) in mvTechInp else 0) for cp in comm if (t,g,cp) in mTechGroupComm));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechShareInpUp ", end = "")
# eqTechShareInpUp(tech, region, group, comm, year, slice)$meqTechShareInpUp(tech, region, group, comm, year, slice)
model.eqTechShareInpUp = Constraint(meqTechShareInpUp, rule = lambda model, t, r, g, c, y, s : model.vTechInp[t,c,r,y,s] <=  pTechShareUp.get((t,c,r,y,s))*sum((model.vTechInp[t,cp,r,y,s] if (t,cp,r,y,s) in mvTechInp else 0) for cp in comm if (t,g,cp) in mTechGroupComm));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechShareOutLo ", end = "")
# eqTechShareOutLo(tech, region, group, comm, year, slice)$meqTechShareOutLo(tech, region, group, comm, year, slice)
model.eqTechShareOutLo = Constraint(meqTechShareOutLo, rule = lambda model, t, r, g, c, y, s : model.vTechOut[t,c,r,y,s]  >=  pTechShareLo.get((t,c,r,y,s))*sum((model.vTechOut[t,cp,r,y,s] if (t,cp,r,y,s) in mvTechOut else 0) for cp in comm if (t,g,cp) in mTechGroupComm));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechShareOutUp ", end = "")
# eqTechShareOutUp(tech, region, group, comm, year, slice)$meqTechShareOutUp(tech, region, group, comm, year, slice)
model.eqTechShareOutUp = Constraint(meqTechShareOutUp, rule = lambda model, t, r, g, c, y, s : model.vTechOut[t,c,r,y,s] <=  pTechShareUp.get((t,c,r,y,s))*sum((model.vTechOut[t,cp,r,y,s] if (t,cp,r,y,s) in mvTechOut else 0) for cp in comm if (t,g,cp) in mTechGroupComm));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechAInp ", end = "")
# eqTechAInp(tech, comm, region, year, slice)$mvTechAInp(tech, comm, region, year, slice)
model.eqTechAInp = Constraint(mvTechAInp, rule = lambda model, t, c, r, y, s : model.vTechAInp[t,c,r,y,s]  ==  ((model.vTechAct[t,r,y,s]*pTechAct2AInp.get((t,c,r,y,s))) if (t,c,r,y,s) in mTechAct2AInp else 0)+((model.vTechCap[t,r,y]*pTechCap2AInp.get((t,c,r,y,s))) if (t,c,r,y,s) in mTechCap2AInp else 0)+((model.vTechNewCap[t,r,y]*pTechNCap2AInp.get((t,c,r,y,s))) if (t,c,r,y,s) in mTechNCap2AInp else 0)+sum(pTechCinp2AInp.get((t,c,cp,r,y,s))*model.vTechInp[t,cp,r,y,s] for cp in comm if (t,c,cp,r,y,s) in mTechCinp2AInp)+sum(pTechCout2AInp.get((t,c,cp,r,y,s))*model.vTechOut[t,cp,r,y,s] for cp in comm if (t,c,cp,r,y,s) in mTechCout2AInp));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechAOut ", end = "")
# eqTechAOut(tech, comm, region, year, slice)$mvTechAOut(tech, comm, region, year, slice)
model.eqTechAOut = Constraint(mvTechAOut, rule = lambda model, t, c, r, y, s : model.vTechAOut[t,c,r,y,s]  ==  ((model.vTechAct[t,r,y,s]*pTechAct2AOut.get((t,c,r,y,s))) if (t,c,r,y,s) in mTechAct2AOut else 0)+((model.vTechCap[t,r,y]*pTechCap2AOut.get((t,c,r,y,s))) if (t,c,r,y,s) in mTechCap2AOut else 0)+((model.vTechNewCap[t,r,y]*pTechNCap2AOut.get((t,c,r,y,s))) if (t,c,r,y,s) in mTechNCap2AOut else 0)+sum(pTechCinp2AOut.get((t,c,cp,r,y,s))*model.vTechInp[t,cp,r,y,s] for cp in comm if (t,c,cp,r,y,s) in mTechCinp2AOut)+sum(pTechCout2AOut.get((t,c,cp,r,y,s))*model.vTechOut[t,cp,r,y,s] for cp in comm if (t,c,cp,r,y,s) in mTechCout2AOut));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechAfLo ", end = "")
# eqTechAfLo(tech, region, year, slice)$meqTechAfLo(tech, region, year, slice)
model.eqTechAfLo = Constraint(meqTechAfLo, rule = lambda model, t, r, y, s : pTechAfLo.get((t,r,y,s))*pTechCap2act.get((t))*model.vTechCap[t,r,y]*pSliceShare.get((s))*prod(pTechWeatherAfLo.get((wth1,t))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,t) in mTechWeatherAfLo) <=  model.vTechAct[t,r,y,s]);
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechAfUp ", end = "")
# eqTechAfUp(tech, region, year, slice)$meqTechAfUp(tech, region, year, slice)
model.eqTechAfUp = Constraint(meqTechAfUp, rule = lambda model, t, r, y, s : model.vTechAct[t,r,y,s] <=  pTechAfUp.get((t,r,y,s))*pTechCap2act.get((t))*model.vTechCap[t,r,y]*pSliceShare.get((s))*prod(pTechWeatherAfUp.get((wth1,t))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,t) in mTechWeatherAfUp));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechAfsLo ", end = "")
# eqTechAfsLo(tech, region, year, slice)$meqTechAfsLo(tech, region, year, slice)
model.eqTechAfsLo = Constraint(meqTechAfsLo, rule = lambda model, t, r, y, s : pTechAfsLo.get((t,r,y,s))*pTechCap2act.get((t))*model.vTechCap[t,r,y]*pSliceShare.get((s))*prod(pTechWeatherAfsLo.get((wth1,t))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,t) in mTechWeatherAfsLo) <=  sum((model.vTechAct[t,r,y,sp] if (t,r,y,sp) in mvTechAct else 0) for sp in slice if (s,sp) in mSliceParentChildE));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechAfsUp ", end = "")
# eqTechAfsUp(tech, region, year, slice)$meqTechAfsUp(tech, region, year, slice)
model.eqTechAfsUp = Constraint(meqTechAfsUp, rule = lambda model, t, r, y, s : sum((model.vTechAct[t,r,y,sp] if (t,r,y,sp) in mvTechAct else 0) for sp in slice if (s,sp) in mSliceParentChildE) <=  pTechAfsUp.get((t,r,y,s))*pTechCap2act.get((t))*model.vTechCap[t,r,y]*pSliceShare.get((s))*prod(pTechWeatherAfsUp.get((wth1,t))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,t) in mTechWeatherAfsUp));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechRampUp ", end = "")
# eqTechRampUp(tech, region, year, slice)$mTechRampUp(tech, region, year, slice)
model.eqTechRampUp = Constraint(mTechRampUp, rule = lambda model, t, r, y, s : (model.vTechAct[t,r,y,s]) / (pSliceShare.get((s)))-sum((model.vTechAct[t,r,y,sp]) / (pSliceShare.get((sp))) for sp in slice if (((t in mTechFullYear and (sp,s) in mSliceNext) or (not((t in mTechFullYear)) and (sp,s) in mSliceFYearNext)) and (t,r,y,sp) in mvTechAct)) <=  (pSliceShare.get((s))*365*24*pTechCap2act.get((t))*model.vTechCap[t,r,y]) / (pTechRampUp.get((t,r,y,s))));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechRampDown ", end = "")
# eqTechRampDown(tech, region, year, slice)$mTechRampDown(tech, region, year, slice)
model.eqTechRampDown = Constraint(mTechRampDown, rule = lambda model, t, r, y, s : sum((model.vTechAct[t,r,y,sp]) / (pSliceShare.get((sp))) for sp in slice if (((t in mTechFullYear and (sp,s) in mSliceNext) or (not((t in mTechFullYear)) and (sp,s) in mSliceFYearNext)) and (t,r,y,sp) in mvTechAct))-(model.vTechAct[t,r,y,s]) / (pSliceShare.get((s))) <=  (pSliceShare.get((s))*365*24*pTechCap2act.get((t))*model.vTechCap[t,r,y]) / (pTechRampDown.get((t,r,y,s))));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechActSng ", end = "")
# eqTechActSng(tech, comm, region, year, slice)$meqTechActSng(tech, comm, region, year, slice)
model.eqTechActSng = Constraint(meqTechActSng, rule = lambda model, t, c, r, y, s : model.vTechAct[t,r,y,s]  ==  (model.vTechOut[t,c,r,y,s]) / (pTechCact2cout.get((t,c,r,y,s))));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechActGrp ", end = "")
# eqTechActGrp(tech, group, region, year, slice)$meqTechActGrp(tech, group, region, year, slice)
model.eqTechActGrp = Constraint(meqTechActGrp, rule = lambda model, t, g, r, y, s : model.vTechAct[t,r,y,s]  ==  sum((((model.vTechOut[t,c,r,y,s]) / (pTechCact2cout.get((t,c,r,y,s)))) if (t,c,r,y,s) in mvTechOut else 0) for c in comm if (t,g,c) in mTechGroupComm));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechAfcOutLo ", end = "")
# eqTechAfcOutLo(tech, region, comm, year, slice)$meqTechAfcOutLo(tech, region, comm, year, slice)
model.eqTechAfcOutLo = Constraint(meqTechAfcOutLo, rule = lambda model, t, r, c, y, s : pTechCact2cout.get((t,c,r,y,s))*pTechAfcLo.get((t,c,r,y,s))*pTechCap2act.get((t))*model.vTechCap[t,r,y]*pSliceShare.get((s))*prod(pTechWeatherAfcLo.get((wth1,t,c))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,t,c) in mTechWeatherAfcLo) <=  model.vTechOut[t,c,r,y,s]);
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechAfcOutUp ", end = "")
# eqTechAfcOutUp(tech, region, comm, year, slice)$meqTechAfcOutUp(tech, region, comm, year, slice)
model.eqTechAfcOutUp = Constraint(meqTechAfcOutUp, rule = lambda model, t, r, c, y, s : model.vTechOut[t,c,r,y,s] <=  pTechCact2cout.get((t,c,r,y,s))*pTechAfcUp.get((t,c,r,y,s))*pTechCap2act.get((t))*model.vTechCap[t,r,y]*prod(pTechWeatherAfcUp.get((wth1,t,c))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,t,c) in mTechWeatherAfcUp));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechAfcInpLo ", end = "")
# eqTechAfcInpLo(tech, region, comm, year, slice)$meqTechAfcInpLo(tech, region, comm, year, slice)
model.eqTechAfcInpLo = Constraint(meqTechAfcInpLo, rule = lambda model, t, r, c, y, s : pTechAfcLo.get((t,c,r,y,s))*pTechCap2act.get((t))*model.vTechCap[t,r,y]*pSliceShare.get((s))*prod(pTechWeatherAfcLo.get((wth1,t,c))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,t,c) in mTechWeatherAfcLo) <=  model.vTechInp[t,c,r,y,s]);
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechAfcInpUp ", end = "")
# eqTechAfcInpUp(tech, region, comm, year, slice)$meqTechAfcInpUp(tech, region, comm, year, slice)
model.eqTechAfcInpUp = Constraint(meqTechAfcInpUp, rule = lambda model, t, r, c, y, s : model.vTechInp[t,c,r,y,s] <=  pTechAfcUp.get((t,c,r,y,s))*pTechCap2act.get((t))*model.vTechCap[t,r,y]*pSliceShare.get((s))*prod(pTechWeatherAfcUp.get((wth1,t,c))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,t,c) in mTechWeatherAfcUp));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechCap ", end = "")
# eqTechCap(tech, region, year)$mTechSpan(tech, region, year)
model.eqTechCap = Constraint(mTechSpan, rule = lambda model, t, r, y : model.vTechCap[t,r,y]  ==  pTechStock.get((t,r,y))-(model.vTechRetiredStock[t,r,y] if (t,r,y) in mvTechRetiredStock else 0)+sum(model.vTechNewCap[t,r,yp]-sum(model.vTechRetiredNewCap[t,r,yp,ye] for ye in year if ((t,r,yp,ye) in mvTechRetiredNewCap and ordYear.get((y)) >= ordYear.get((ye)))) for yp in year if ((t,r,yp) in mTechNew and ordYear.get((y)) >= ordYear.get((yp)) and (ordYear.get((y))<pTechOlife.get((t,r))+ordYear.get((yp)) or (t,r) in mTechOlifeInf))));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechRetiredNewCap ", end = "")
# eqTechRetiredNewCap(tech, region, year)$meqTechRetiredNewCap(tech, region, year)
model.eqTechRetiredNewCap = Constraint(meqTechRetiredNewCap, rule = lambda model, t, r, y : sum(model.vTechRetiredNewCap[t,r,y,yp] for yp in year if (t,r,y,yp) in mvTechRetiredNewCap) <=  model.vTechNewCap[t,r,y]);
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechRetiredStock ", end = "")
# eqTechRetiredStock(tech, region, year)$mvTechRetiredStock(tech, region, year)
model.eqTechRetiredStock = Constraint(mvTechRetiredStock, rule = lambda model, t, r, y : model.vTechRetiredStock[t,r,y] <=  pTechStock.get((t,r,y)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechEac ", end = "")
# eqTechEac(tech, region, year)$mTechEac(tech, region, year)
model.eqTechEac = Constraint(mTechEac, rule = lambda model, t, r, y : model.vTechEac[t,r,y]  ==  sum(pTechEac.get((t,r,yp))*(model.vTechNewCap[t,r,yp]-sum(model.vTechRetiredNewCap[t,r,yp,ye] for ye in year if ((t,r,yp,ye) in mvTechRetiredNewCap and ordYear.get((y)) >= ordYear.get((ye))))) for yp in year if ((t,r,yp) in mTechNew and ordYear.get((y)) >= ordYear.get((yp)) and (ordYear.get((y))<pTechOlife.get((t,r))+ordYear.get((yp)) or (t,r) in mTechOlifeInf))));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechInv ", end = "")
# eqTechInv(tech, region, year)$mTechInv(tech, region, year)
model.eqTechInv = Constraint(mTechInv, rule = lambda model, t, r, y : model.vTechInv[t,r,y]  ==  pTechInvcost.get((t,r,y))*model.vTechNewCap[t,r,y]);
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechOMCost ", end = "")
# eqTechOMCost(tech, region, year)$mTechOMCost(tech, region, year)
model.eqTechOMCost = Constraint(mTechOMCost, rule = lambda model, t, r, y : model.vTechOMCost[t,r,y]  ==  pTechFixom.get((t,r,y))*model.vTechCap[t,r,y]+sum(pTechVarom.get((t,r,y,s))*model.vTechAct[t,r,y,s]+sum(pTechCvarom.get((t,c,r,y,s))*model.vTechInp[t,c,r,y,s] for c in comm if (t,c) in mTechInpComm)+sum(pTechCvarom.get((t,c,r,y,s))*model.vTechOut[t,c,r,y,s] for c in comm if (t,c) in mTechOutComm)+sum(pTechAvarom.get((t,c,r,y,s))*model.vTechAOut[t,c,r,y,s] for c in comm if (t,c,r,y,s) in mvTechAOut)+sum(pTechAvarom.get((t,c,r,y,s))*model.vTechAInp[t,c,r,y,s] for c in comm if (t,c,r,y,s) in mvTechAInp) for s in slice if (t,s) in mTechSlice));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqSupAvaUp ", end = "")
# eqSupAvaUp(sup, comm, region, year, slice)$mSupAvaUp(sup, comm, region, year, slice)
model.eqSupAvaUp = Constraint(mSupAvaUp, rule = lambda model, s1, c, r, y, s : model.vSupOut[s1,c,r,y,s] <=  pSupAvaUp.get((s1,c,r,y,s))*prod(pSupWeatherUp.get((wth1,s1))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,s1) in mSupWeatherUp));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqSupAvaLo ", end = "")
# eqSupAvaLo(sup, comm, region, year, slice)$meqSupAvaLo(sup, comm, region, year, slice)
model.eqSupAvaLo = Constraint(meqSupAvaLo, rule = lambda model, s1, c, r, y, s : model.vSupOut[s1,c,r,y,s]  >=  pSupAvaLo.get((s1,c,r,y,s))*prod(pSupWeatherLo.get((wth1,s1))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,s1) in mSupWeatherLo));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqSupTotal ", end = "")
# eqSupTotal(sup, comm, region)$mvSupReserve(sup, comm, region)
model.eqSupTotal = Constraint(mvSupReserve, rule = lambda model, s1, c, r : model.vSupReserve[s1,c,r]  ==  sum(pPeriodLen.get((y))*model.vSupOut[s1,c,r,y,s] for y in year for s in slice if (s1,c,r,y,s) in mSupAva));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqSupReserveUp ", end = "")
# eqSupReserveUp(sup, comm, region)$mSupReserveUp(sup, comm, region)
model.eqSupReserveUp = Constraint(mSupReserveUp, rule = lambda model, s1, c, r : pSupReserveUp.get((s1,c,r))  >=  model.vSupReserve[s1,c,r]);
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqSupReserveLo ", end = "")
# eqSupReserveLo(sup, comm, region)$meqSupReserveLo(sup, comm, region)
model.eqSupReserveLo = Constraint(meqSupReserveLo, rule = lambda model, s1, c, r : model.vSupReserve[s1,c,r]  >=  pSupReserveLo.get((s1,c,r)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqSupCost ", end = "")
# eqSupCost(sup, region, year)$mvSupCost(sup, region, year)
model.eqSupCost = Constraint(mvSupCost, rule = lambda model, s1, r, y : model.vSupCost[s1,r,y]  ==  sum(pSupCost.get((s1,c,r,y,s))*model.vSupOut[s1,c,r,y,s] for c in comm for s in slice if (s1,c,r,y,s) in mSupAva));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqDemInp ", end = "")
# eqDemInp(comm, region, year, slice)$mvDemInp(comm, region, year, slice)
model.eqDemInp = Constraint(mvDemInp, rule = lambda model, c, r, y, s : model.vDemInp[c,r,y,s]  ==  sum(pDemand.get((d,c,r,y,s)) for d in dem if (d,c) in mDemComm));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqAggOut ", end = "")
# eqAggOut(comm, region, year, slice)$mAggOut(comm, region, year, slice)
model.eqAggOut = Constraint(mAggOut, rule = lambda model, c, r, y, s : model.vAggOut[c,r,y,s]  ==  sum(pAggregateFactor.get((c,cp))*sum(model.vOutTot[cp,r,y,sp] for sp in slice if ((c,r,y,sp) in mvOutTot and (s,sp) in mSliceParentChildE and (cp,sp) in mCommSlice)) for cp in comm if (c,cp) in mAggregateFactor));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqEmsFuelTot ", end = "")
# eqEmsFuelTot(comm, region, year, slice)$mEmsFuelTot(comm, region, year, slice)
model.eqEmsFuelTot = Constraint(mEmsFuelTot, rule = lambda model, c, r, y, s : model.vEmsFuelTot[c,r,y,s]  ==  sum(pEmissionFactor.get((c,cp))*sum(pTechEmisComm.get((t,cp))*sum((model.vTechInp[t,cp,r,y,sp] if (t,c,cp,r,y,sp) in mTechEmsFuel else 0) for sp in slice if (c,s,sp) in mCommSliceOrParent) for t in tech if (t,cp) in mTechInpComm) for cp in comm if (pEmissionFactor.get((c,cp))>0)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageAInp ", end = "")
# eqStorageAInp(stg, comm, region, year, slice)$mvStorageAInp(stg, comm, region, year, slice)
model.eqStorageAInp = Constraint(mvStorageAInp, rule = lambda model, st1, c, r, y, s : model.vStorageAInp[st1,c,r,y,s]  ==  sum(((pStorageStg2AInp.get((st1,c,r,y,s))*model.vStorageStore[st1,cp,r,y,s]) if (st1,c,r,y,s) in mStorageStg2AInp else 0)+((pStorageCinp2AInp.get((st1,c,r,y,s))*model.vStorageInp[st1,cp,r,y,s]) if (st1,c,r,y,s) in mStorageCinp2AInp else 0)+((pStorageCout2AInp.get((st1,c,r,y,s))*model.vStorageOut[st1,cp,r,y,s]) if (st1,c,r,y,s) in mStorageCout2AInp else 0)+((pStorageCap2AInp.get((st1,c,r,y,s))*model.vStorageCap[st1,r,y]) if (st1,c,r,y,s) in mStorageCap2AInp else 0)+((pStorageNCap2AInp.get((st1,c,r,y,s))*model.vStorageNewCap[st1,r,y]) if (st1,c,r,y,s) in mStorageNCap2AInp else 0) for cp in comm if (st1,cp) in mStorageComm));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageAOut ", end = "")
# eqStorageAOut(stg, comm, region, year, slice)$mvStorageAOut(stg, comm, region, year, slice)
model.eqStorageAOut = Constraint(mvStorageAOut, rule = lambda model, st1, c, r, y, s : model.vStorageAOut[st1,c,r,y,s]  ==  sum(((pStorageStg2AOut.get((st1,c,r,y,s))*model.vStorageStore[st1,cp,r,y,s]) if (st1,c,r,y,s) in mStorageStg2AOut else 0)+((pStorageCinp2AOut.get((st1,c,r,y,s))*model.vStorageInp[st1,cp,r,y,s]) if (st1,c,r,y,s) in mStorageCinp2AOut else 0)+((pStorageCout2AOut.get((st1,c,r,y,s))*model.vStorageOut[st1,cp,r,y,s]) if (st1,c,r,y,s) in mStorageCout2AOut else 0)+((pStorageCap2AOut.get((st1,c,r,y,s))*model.vStorageCap[st1,r,y]) if (st1,c,r,y,s) in mStorageCap2AOut else 0)+((pStorageNCap2AOut.get((st1,c,r,y,s))*model.vStorageNewCap[st1,r,y]) if (st1,c,r,y,s) in mStorageNCap2AOut else 0) for cp in comm if (st1,cp) in mStorageComm));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageStore ", end = "")
# eqStorageStore(stg, comm, region, year, slice)$mvStorageStore(stg, comm, region, year, slice)
model.eqStorageStore = Constraint(mvStorageStore, rule = lambda model, st1, c, r, y, s : model.vStorageStore[st1,c,r,y,s]  ==  pStorageCharge.get((st1,c,r,y,s))+((pStorageNCap2Stg.get((st1,c,r,y,s))*model.vStorageNewCap[st1,r,y]) if (st1,r,y) in mStorageNew else 0)+sum(pStorageInpEff.get((st1,c,r,y,sp))*model.vStorageInp[st1,c,r,y,sp]+((pStorageStgEff.get((st1,c,r,y,s)))**(pSliceShare.get((s))))*model.vStorageStore[st1,c,r,y,sp]-(model.vStorageOut[st1,c,r,y,sp]) / (pStorageOutEff.get((st1,c,r,y,sp))) for sp in slice if ((c,sp) in mCommSlice and ((not((st1 in mStorageFullYear)) and (sp,s) in mSliceNext) or (st1 in mStorageFullYear and (sp,s) in mSliceFYearNext)))));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageAfLo ", end = "")
# eqStorageAfLo(stg, comm, region, year, slice)$meqStorageAfLo(stg, comm, region, year, slice)
model.eqStorageAfLo = Constraint(meqStorageAfLo, rule = lambda model, st1, c, r, y, s : model.vStorageStore[st1,c,r,y,s]  >=  pStorageAfLo.get((st1,r,y,s))*pStorageCap2stg.get((st1))*model.vStorageCap[st1,r,y]*prod(pStorageWeatherAfLo.get((wth1,st1))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,st1) in mStorageWeatherAfLo));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageAfUp ", end = "")
# eqStorageAfUp(stg, comm, region, year, slice)$meqStorageAfUp(stg, comm, region, year, slice)
model.eqStorageAfUp = Constraint(meqStorageAfUp, rule = lambda model, st1, c, r, y, s : model.vStorageStore[st1,c,r,y,s] <=  pStorageAfUp.get((st1,r,y,s))*pStorageCap2stg.get((st1))*model.vStorageCap[st1,r,y]*prod(pStorageWeatherAfUp.get((wth1,st1))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,st1) in mStorageWeatherAfUp));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageClean ", end = "")
# eqStorageClean(stg, comm, region, year, slice)$mvStorageStore(stg, comm, region, year, slice)
model.eqStorageClean = Constraint(mvStorageStore, rule = lambda model, st1, c, r, y, s : (model.vStorageOut[st1,c,r,y,s]) / (pStorageOutEff.get((st1,c,r,y,s))) <=  model.vStorageStore[st1,c,r,y,s]);
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageInpUp ", end = "")
# eqStorageInpUp(stg, comm, region, year, slice)$meqStorageInpUp(stg, comm, region, year, slice)
model.eqStorageInpUp = Constraint(meqStorageInpUp, rule = lambda model, st1, c, r, y, s : model.vStorageInp[st1,c,r,y,s] <=  pStorageCap2stg.get((st1))*model.vStorageCap[st1,r,y]*pStorageCinpUp.get((st1,c,r,y,s))*pSliceShare.get((s))*prod(pStorageWeatherCinpUp.get((wth1,st1))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,st1) in mStorageWeatherCinpUp));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageInpLo ", end = "")
# eqStorageInpLo(stg, comm, region, year, slice)$meqStorageInpLo(stg, comm, region, year, slice)
model.eqStorageInpLo = Constraint(meqStorageInpLo, rule = lambda model, st1, c, r, y, s : model.vStorageInp[st1,c,r,y,s]  >=  pStorageCap2stg.get((st1))*model.vStorageCap[st1,r,y]*pStorageCinpLo.get((st1,c,r,y,s))*pSliceShare.get((s))*prod(pStorageWeatherCinpLo.get((wth1,st1))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,st1) in mStorageWeatherCinpLo));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageOutUp ", end = "")
# eqStorageOutUp(stg, comm, region, year, slice)$meqStorageOutUp(stg, comm, region, year, slice)
model.eqStorageOutUp = Constraint(meqStorageOutUp, rule = lambda model, st1, c, r, y, s : model.vStorageOut[st1,c,r,y,s] <=  pStorageCap2stg.get((st1))*model.vStorageCap[st1,r,y]*pStorageCoutUp.get((st1,c,r,y,s))*pSliceShare.get((s))*prod(pStorageWeatherCoutUp.get((wth1,st1))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,st1) in mStorageWeatherCoutUp));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageOutLo ", end = "")
# eqStorageOutLo(stg, comm, region, year, slice)$meqStorageOutLo(stg, comm, region, year, slice)
model.eqStorageOutLo = Constraint(meqStorageOutLo, rule = lambda model, st1, c, r, y, s : model.vStorageOut[st1,c,r,y,s]  >=  pStorageCap2stg.get((st1))*model.vStorageCap[st1,r,y]*pStorageCoutLo.get((st1,c,r,y,s))*pSliceShare.get((s))*prod(pStorageWeatherCoutLo.get((wth1,st1))*pWeather.get((wth1,r,y,s)) for wth1 in weather if (wth1,st1) in mStorageWeatherCoutLo));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageCap ", end = "")
# eqStorageCap(stg, region, year)$mStorageSpan(stg, region, year)
model.eqStorageCap = Constraint(mStorageSpan, rule = lambda model, st1, r, y : model.vStorageCap[st1,r,y]  ==  pStorageStock.get((st1,r,y))+sum(model.vStorageNewCap[st1,r,yp] for yp in year if (ordYear.get((y)) >= ordYear.get((yp)) and ((st1,r) in mStorageOlifeInf or ordYear.get((y))<pStorageOlife.get((st1,r))+ordYear.get((yp))) and (st1,r,yp) in mStorageNew)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageInv ", end = "")
# eqStorageInv(stg, region, year)$mStorageNew(stg, region, year)
model.eqStorageInv = Constraint(mStorageNew, rule = lambda model, st1, r, y : model.vStorageInv[st1,r,y]  ==  pStorageInvcost.get((st1,r,y))*model.vStorageNewCap[st1,r,y]);
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageEac ", end = "")
# eqStorageEac(stg, region, year)$mStorageEac(stg, region, year)
model.eqStorageEac = Constraint(mStorageEac, rule = lambda model, st1, r, y : model.vStorageEac[st1,r,y]  ==  sum(pStorageEac.get((st1,r,yp))*model.vStorageNewCap[st1,r,yp] for yp in year if ((st1,r,yp) in mStorageNew and ordYear.get((y)) >= ordYear.get((yp)) and ((st1,r) in mStorageOlifeInf or ordYear.get((y))<pStorageOlife.get((st1,r))+ordYear.get((yp))) and pStorageInvcost.get((st1,r,yp)) != 0)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageCost ", end = "")
# eqStorageCost(stg, region, year)$mStorageOMCost(stg, region, year)
model.eqStorageCost = Constraint(mStorageOMCost, rule = lambda model, st1, r, y : model.vStorageOMCost[st1,r,y]  ==  pStorageFixom.get((st1,r,y))*model.vStorageCap[st1,r,y]+sum(sum(pStorageCostInp.get((st1,r,y,s))*model.vStorageInp[st1,c,r,y,s]+pStorageCostOut.get((st1,r,y,s))*model.vStorageOut[st1,c,r,y,s]+pStorageCostStore.get((st1,r,y,s))*model.vStorageStore[st1,c,r,y,s] for s in slice if (c,s) in mCommSlice) for c in comm if (st1,c) in mStorageComm));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqImport ", end = "")
# eqImport(comm, dst, year, slice)$mImport(comm, dst, year, slice)
model.eqImport = Constraint(mImport, rule = lambda model, c, dst, y, s : model.vImport[c,dst,y,s]  ==  sum(sum(sum(((pTradeIrEff.get((t1,src,dst,y,sp))*model.vTradeIr[t1,c,src,dst,y,sp]) if (t1,c,src,dst,y,sp) in mvTradeIr else 0) for src in region if (t1,src,dst) in mTradeRoutes) for t1 in trade if (t1,c) in mTradeComm) for sp in slice if (c,s,sp) in mCommSliceOrParent)+sum(sum((model.vImportRow[i,c,dst,y,sp] if (i,c,dst,y,sp) in mImportRow else 0) for i in imp if (i,c) in mImpComm) for sp in slice if (c,s,sp) in mCommSliceOrParent));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqExport ", end = "")
# eqExport(comm, src, year, slice)$mExport(comm, src, year, slice)
model.eqExport = Constraint(mExport, rule = lambda model, c, src, y, s : model.vExport[c,src,y,s]  ==  sum(sum(sum((model.vTradeIr[t1,c,src,dst,y,sp] if (t1,c,src,dst,y,sp) in mvTradeIr else 0) for dst in region if (t1,src,dst) in mTradeRoutes) for t1 in trade if (t1,c) in mTradeComm) for sp in slice if (c,s,sp) in mCommSliceOrParent)+sum(sum((model.vExportRow[e,c,src,y,sp] if (e,c,src,y,sp) in mExportRow else 0) for e in expp if (e,c) in mExpComm) for sp in slice if (c,s,sp) in mCommSliceOrParent));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTradeFlowUp ", end = "")
# eqTradeFlowUp(trade, comm, src, dst, year, slice)$meqTradeFlowUp(trade, comm, src, dst, year, slice)
model.eqTradeFlowUp = Constraint(meqTradeFlowUp, rule = lambda model, t1, c, src, dst, y, s : model.vTradeIr[t1,c,src,dst,y,s] <=  pTradeIrUp.get((t1,src,dst,y,s)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTradeFlowLo ", end = "")
# eqTradeFlowLo(trade, comm, src, dst, year, slice)$meqTradeFlowLo(trade, comm, src, dst, year, slice)
model.eqTradeFlowLo = Constraint(meqTradeFlowLo, rule = lambda model, t1, c, src, dst, y, s : model.vTradeIr[t1,c,src,dst,y,s]  >=  pTradeIrLo.get((t1,src,dst,y,s)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqCostTrade ", end = "")
# eqCostTrade(region, year)$mvTradeCost(region, year)
model.eqCostTrade = Constraint(mvTradeCost, rule = lambda model, r, y : model.vTradeCost[r,y]  ==  (model.vTradeRowCost[r,y] if (r,y) in mvTradeRowCost else 0)+(model.vTradeIrCost[r,y] if (r,y) in mvTradeIrCost else 0));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqCostRowTrade ", end = "")
# eqCostRowTrade(region, year)$mvTradeRowCost(region, year)
model.eqCostRowTrade = Constraint(mvTradeRowCost, rule = lambda model, r, y : model.vTradeRowCost[r,y]  ==  sum(pImportRowPrice.get((i,r,y,s))*model.vImportRow[i,c,r,y,s] for i in imp for c in comm for s in slice if (i,c,r,y,s) in mImportRow)-sum(pExportRowPrice.get((e,r,y,s))*model.vExportRow[e,c,r,y,s] for e in expp for c in comm for s in slice if (e,c,r,y,s) in mExportRow));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqCostIrTrade ", end = "")
# eqCostIrTrade(region, year)$mvTradeIrCost(region, year)
model.eqCostIrTrade = Constraint(mvTradeIrCost, rule = lambda model, r, y : model.vTradeIrCost[r,y]  ==  sum(model.vTradeEac[t1,r,y] for t1 in trade if (t1,r,y) in mTradeEac)+sum(sum(sum(((((pTradeIrCost.get((t1,src,r,y,s))+pTradeIrMarkup.get((t1,src,r,y,s)))*model.vTradeIr[t1,c,src,r,y,s])) if (t1,c,src,r,y,s) in mvTradeIr else 0) for s in slice if (t1,s) in mTradeSlice) for c in comm if (t1,c) in mTradeComm) for t1 in trade for src in region if (t1,src,r) in mTradeRoutes)-sum(sum(sum((((pTradeIrMarkup.get((t1,r,dst,y,s))*model.vTradeIr[t1,c,r,dst,y,s])) if (t1,c,r,dst,y,s) in mvTradeIr else 0) for s in slice if (t1,s) in mTradeSlice) for c in comm if (t1,c) in mTradeComm) for t1 in trade for dst in region if (t1,r,dst) in mTradeRoutes));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqExportRowUp ", end = "")
# eqExportRowUp(expp, comm, region, year, slice)$mExportRowUp(expp, comm, region, year, slice)
model.eqExportRowUp = Constraint(mExportRowUp, rule = lambda model, e, c, r, y, s : model.vExportRow[e,c,r,y,s] <=  pExportRowUp.get((e,r,y,s)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqExportRowLo ", end = "")
# eqExportRowLo(expp, comm, region, year, slice)$meqExportRowLo(expp, comm, region, year, slice)
model.eqExportRowLo = Constraint(meqExportRowLo, rule = lambda model, e, c, r, y, s : model.vExportRow[e,c,r,y,s]  >=  pExportRowLo.get((e,r,y,s)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqExportRowCumulative ", end = "")
# eqExportRowCumulative(expp, comm)$mExpComm(expp, comm)
model.eqExportRowCumulative = Constraint(mExpComm, rule = lambda model, e, c : model.vExportRowAccumulated[e,c]  ==  sum(pPeriodLen.get((y))*model.vExportRow[e,c,r,y,s] for r in region for y in year for s in slice if (e,c,r,y,s) in mExportRow));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqExportRowResUp ", end = "")
# eqExportRowResUp(expp, comm)$mExportRowAccumulatedUp(expp, comm)
model.eqExportRowResUp = Constraint(mExportRowAccumulatedUp, rule = lambda model, e, c : model.vExportRowAccumulated[e,c] <=  pExportRowRes.get((e)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqImportRowUp ", end = "")
# eqImportRowUp(imp, comm, region, year, slice)$mImportRowUp(imp, comm, region, year, slice)
model.eqImportRowUp = Constraint(mImportRowUp, rule = lambda model, i, c, r, y, s : model.vImportRow[i,c,r,y,s] <=  pImportRowUp.get((i,r,y,s)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqImportRowLo ", end = "")
# eqImportRowLo(imp, comm, region, year, slice)$meqImportRowLo(imp, comm, region, year, slice)
model.eqImportRowLo = Constraint(meqImportRowLo, rule = lambda model, i, c, r, y, s : model.vImportRow[i,c,r,y,s]  >=  pImportRowLo.get((i,r,y,s)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqImportRowAccumulated ", end = "")
# eqImportRowAccumulated(imp, comm)$mImpComm(imp, comm)
model.eqImportRowAccumulated = Constraint(mImpComm, rule = lambda model, i, c : model.vImportRowAccumulated[i,c]  ==  sum(pPeriodLen.get((y))*model.vImportRow[i,c,r,y,s] for r in region for y in year for s in slice if (i,c,r,y,s) in mImportRow));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqImportRowResUp ", end = "")
# eqImportRowResUp(imp, comm)$mImportRowAccumulatedUp(imp, comm)
model.eqImportRowResUp = Constraint(mImportRowAccumulatedUp, rule = lambda model, i, c : model.vImportRowAccumulated[i,c] <=  pImportRowRes.get((i)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTradeCapFlow ", end = "")
# eqTradeCapFlow(trade, comm, year, slice)$meqTradeCapFlow(trade, comm, year, slice)
model.eqTradeCapFlow = Constraint(meqTradeCapFlow, rule = lambda model, t1, c, y, s : pSliceShare.get((s))*pTradeCap2Act.get((t1))*model.vTradeCap[t1,y]  >=  sum(model.vTradeIr[t1,c,src,dst,y,s] for src in region for dst in region if (t1,c,src,dst,y,s) in mvTradeIr));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTradeCap ", end = "")
# eqTradeCap(trade, year)$mTradeSpan(trade, year)
model.eqTradeCap = Constraint(mTradeSpan, rule = lambda model, t1, y : model.vTradeCap[t1,y]  ==  pTradeStock.get((t1,y))+sum(model.vTradeNewCap[t1,yp] for yp in year if ((t1,yp) in mTradeNew and ordYear.get((y)) >= ordYear.get((yp)) and (ordYear.get((y))<pTradeOlife.get((t1))+ordYear.get((yp)) or t1 in mTradeOlifeInf))));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTradeInv ", end = "")
# eqTradeInv(trade, region, year)$mTradeInv(trade, region, year)
model.eqTradeInv = Constraint(mTradeInv, rule = lambda model, t1, r, y : model.vTradeInv[t1,r,y]  ==  pTradeInvcost.get((t1,r,y))*model.vTradeNewCap[t1,y]);
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTradeEac ", end = "")
# eqTradeEac(trade, region, year)$mTradeEac(trade, region, year)
model.eqTradeEac = Constraint(mTradeEac, rule = lambda model, t1, r, y : model.vTradeEac[t1,r,y]  ==  sum(pTradeEac.get((t1,r,yp))*model.vTradeNewCap[t1,yp] for yp in year if ((t1,yp) in mTradeNew and ordYear.get((y)) >= ordYear.get((yp)) and (ordYear.get((y))<pTradeOlife.get((t1))+ordYear.get((yp)) or t1 in mTradeOlifeInf))));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTradeIrAInp ", end = "")
# eqTradeIrAInp(trade, comm, region, year, slice)$mvTradeIrAInp(trade, comm, region, year, slice)
model.eqTradeIrAInp = Constraint(mvTradeIrAInp, rule = lambda model, t1, c, r, y, s : model.vTradeIrAInp[t1,c,r,y,s]  ==  sum(pTradeIrCsrc2Ainp.get((t1,c,r,dst,y,s))*sum(model.vTradeIr[t1,cp,r,dst,y,s] for cp in comm if (t1,cp) in mTradeComm) for dst in region if (t1,c,r,dst,y,s) in mTradeIrCsrc2Ainp)+sum(pTradeIrCdst2Ainp.get((t1,c,src,r,y,s))*sum(model.vTradeIr[t1,cp,src,r,y,s] for cp in comm if (t1,cp) in mTradeComm) for src in region if (t1,c,src,r,y,s) in mTradeIrCdst2Ainp));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTradeIrAOut ", end = "")
# eqTradeIrAOut(trade, comm, region, year, slice)$mvTradeIrAOut(trade, comm, region, year, slice)
model.eqTradeIrAOut = Constraint(mvTradeIrAOut, rule = lambda model, t1, c, r, y, s : model.vTradeIrAOut[t1,c,r,y,s]  ==  sum(pTradeIrCsrc2Aout.get((t1,c,r,dst,y,s))*sum(model.vTradeIr[t1,cp,r,dst,y,s] for cp in comm if (t1,cp) in mTradeComm) for dst in region if (t1,c,r,dst,y,s) in mTradeIrCsrc2Aout)+sum(pTradeIrCdst2Aout.get((t1,c,src,r,y,s))*sum(model.vTradeIr[t1,cp,src,r,y,s] for cp in comm if (t1,cp) in mTradeComm) for src in region if (t1,c,src,r,y,s) in mTradeIrCdst2Aout));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTradeIrAInpTot ", end = "")
# eqTradeIrAInpTot(comm, region, year, slice)$mvTradeIrAInpTot(comm, region, year, slice)
model.eqTradeIrAInpTot = Constraint(mvTradeIrAInpTot, rule = lambda model, c, r, y, s : model.vTradeIrAInpTot[c,r,y,s]  ==  sum(model.vTradeIrAInp[t1,c,r,y,sp] for t1 in trade for sp in slice if ((c,s,sp) in mCommSliceOrParent and (t1,c,r,y,sp) in mvTradeIrAInp)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTradeIrAOutTot ", end = "")
# eqTradeIrAOutTot(comm, region, year, slice)$mvTradeIrAOutTot(comm, region, year, slice)
model.eqTradeIrAOutTot = Constraint(mvTradeIrAOutTot, rule = lambda model, c, r, y, s : model.vTradeIrAOutTot[c,r,y,s]  ==  sum(model.vTradeIrAOut[t1,c,r,y,sp] for t1 in trade for sp in slice if ((c,s,sp) in mCommSliceOrParent and (t1,c,r,y,sp) in mvTradeIrAOut)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqBalLo ", end = "")
# eqBalLo(comm, region, year, slice)$meqBalLo(comm, region, year, slice)
model.eqBalLo = Constraint(meqBalLo, rule = lambda model, c, r, y, s : model.vBalance[c,r,y,s]  >=  0);
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqBalUp ", end = "")
# eqBalUp(comm, region, year, slice)$meqBalUp(comm, region, year, slice)
model.eqBalUp = Constraint(meqBalUp, rule = lambda model, c, r, y, s : model.vBalance[c,r,y,s] <=  0);
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqBalFx ", end = "")
# eqBalFx(comm, region, year, slice)$meqBalFx(comm, region, year, slice)
model.eqBalFx = Constraint(meqBalFx, rule = lambda model, c, r, y, s : model.vBalance[c,r,y,s]  ==  0);
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqBal ", end = "")
# eqBal(comm, region, year, slice)$mvBalance(comm, region, year, slice)
model.eqBal = Constraint(mvBalance, rule = lambda model, c, r, y, s : model.vBalance[c,r,y,s]  ==  (model.vOutTot[c,r,y,s] if (c,r,y,s) in mvOutTot else 0)-(model.vInpTot[c,r,y,s] if (c,r,y,s) in mvInpTot else 0));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqOutTot ", end = "")
# eqOutTot(comm, region, year, slice)$mvOutTot(comm, region, year, slice)
model.eqOutTot = Constraint(mvOutTot, rule = lambda model, c, r, y, s : model.vOutTot[c,r,y,s]  ==  (model.vDummyImport[c,r,y,s] if (c,r,y,s) in mDummyImport else 0)+(model.vSupOutTot[c,r,y,s] if (c,r,y,s) in mSupOutTot else 0)+(model.vEmsFuelTot[c,r,y,s] if (c,r,y,s) in mEmsFuelTot else 0)+(model.vAggOut[c,r,y,s] if (c,r,y,s) in mAggOut else 0)+(model.vTechOutTot[c,r,y,s] if (c,r,y,s) in mTechOutTot else 0)+(model.vStorageOutTot[c,r,y,s] if (c,r,y,s) in mStorageOutTot else 0)+(model.vImport[c,r,y,s] if (c,r,y,s) in mImport else 0)+(model.vTradeIrAOutTot[c,r,y,s] if (c,r,y,s) in mvTradeIrAOutTot else 0)+(sum(model.vOut2Lo[c,r,y,sp,s] for sp in slice if ((sp,s) in mSliceParentChild and (c,r,y,sp,s) in mvOut2Lo)) if (c,r,y,s) in mOutSub else 0));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqOut2Lo ", end = "")
# eqOut2Lo(comm, region, year, slice)$mOut2Lo(comm, region, year, slice)
model.eqOut2Lo = Constraint(mOut2Lo, rule = lambda model, c, r, y, s : sum(model.vOut2Lo[c,r,y,s,sp] for sp in slice if (c,r,y,s,sp) in mvOut2Lo)  ==  (model.vSupOutTot[c,r,y,s] if (c,r,y,s) in mSupOutTot else 0)+(model.vEmsFuelTot[c,r,y,s] if (c,r,y,s) in mEmsFuelTot else 0)+(model.vAggOut[c,r,y,s] if (c,r,y,s) in mAggOut else 0)+(model.vTechOutTot[c,r,y,s] if (c,r,y,s) in mTechOutTot else 0)+(model.vStorageOutTot[c,r,y,s] if (c,r,y,s) in mStorageOutTot else 0)+(model.vImport[c,r,y,s] if (c,r,y,s) in mImport else 0)+(model.vTradeIrAOutTot[c,r,y,s] if (c,r,y,s) in mvTradeIrAOutTot else 0));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqInpTot ", end = "")
# eqInpTot(comm, region, year, slice)$mvInpTot(comm, region, year, slice)
model.eqInpTot = Constraint(mvInpTot, rule = lambda model, c, r, y, s : model.vInpTot[c,r,y,s]  ==  (model.vDemInp[c,r,y,s] if (c,r,y,s) in mvDemInp else 0)+(model.vDummyExport[c,r,y,s] if (c,r,y,s) in mDummyExport else 0)+(model.vTechInpTot[c,r,y,s] if (c,r,y,s) in mTechInpTot else 0)+(model.vStorageInpTot[c,r,y,s] if (c,r,y,s) in mStorageInpTot else 0)+(model.vExport[c,r,y,s] if (c,r,y,s) in mExport else 0)+(model.vTradeIrAInpTot[c,r,y,s] if (c,r,y,s) in mvTradeIrAInpTot else 0)+(sum(model.vInp2Lo[c,r,y,sp,s] for sp in slice if ((sp,s) in mSliceParentChild and (c,r,y,sp,s) in mvInp2Lo)) if (c,r,y,s) in mInpSub else 0));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqInp2Lo ", end = "")
# eqInp2Lo(comm, region, year, slice)$mInp2Lo(comm, region, year, slice)
model.eqInp2Lo = Constraint(mInp2Lo, rule = lambda model, c, r, y, s : sum(model.vInp2Lo[c,r,y,s,sp] for sp in slice if (c,r,y,s,sp) in mvInp2Lo)  ==  (model.vTechInpTot[c,r,y,s] if (c,r,y,s) in mTechInpTot else 0)+(model.vStorageInpTot[c,r,y,s] if (c,r,y,s) in mStorageInpTot else 0)+(model.vExport[c,r,y,s] if (c,r,y,s) in mExport else 0)+(model.vTradeIrAInpTot[c,r,y,s] if (c,r,y,s) in mvTradeIrAInpTot else 0));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqSupOutTot ", end = "")
# eqSupOutTot(comm, region, year, slice)$mSupOutTot(comm, region, year, slice)
model.eqSupOutTot = Constraint(mSupOutTot, rule = lambda model, c, r, y, s : model.vSupOutTot[c,r,y,s]  ==  sum(sum(model.vSupOut[s1,c,r,y,sp] for sp in slice if ((c,s,sp) in mCommSliceOrParent and (s1,c,r,y,sp) in mSupAva)) for s1 in sup if (s1,c) in mSupComm));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechInpTot ", end = "")
# eqTechInpTot(comm, region, year, slice)$mTechInpTot(comm, region, year, slice)
model.eqTechInpTot = Constraint(mTechInpTot, rule = lambda model, c, r, y, s : model.vTechInpTot[c,r,y,s]  ==  sum(sum((model.vTechInp[t,c,r,y,sp] if (t,c,r,y,sp) in mvTechInp else 0) for sp in slice if ((t,sp) in mTechSlice and (c,s,sp) in mCommSliceOrParent)) for t in tech if (t,c) in mTechInpComm)+sum(sum((model.vTechAInp[t,c,r,y,sp] if (t,c,r,y,sp) in mvTechAInp else 0) for sp in slice if ((t,sp) in mTechSlice and (c,s,sp) in mCommSliceOrParent)) for t in tech if (t,c) in mTechAInp));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTechOutTot ", end = "")
# eqTechOutTot(comm, region, year, slice)$mTechOutTot(comm, region, year, slice)
model.eqTechOutTot = Constraint(mTechOutTot, rule = lambda model, c, r, y, s : model.vTechOutTot[c,r,y,s]  ==  sum(sum((model.vTechOut[t,c,r,y,sp] if (t,c,r,y,sp) in mvTechOut else 0) for sp in slice if ((t,sp) in mTechSlice and (c,s,sp) in mCommSliceOrParent)) for t in tech if (t,c) in mTechOutComm)+sum(sum((model.vTechAOut[t,c,r,y,sp] if (t,c,r,y,sp) in mvTechAOut else 0) for sp in slice if ((t,sp) in mTechSlice and (c,s,sp) in mCommSliceOrParent)) for t in tech if (t,c) in mTechAOut));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageInpTot ", end = "")
# eqStorageInpTot(comm, region, year, slice)$mStorageInpTot(comm, region, year, slice)
model.eqStorageInpTot = Constraint(mStorageInpTot, rule = lambda model, c, r, y, s : model.vStorageInpTot[c,r,y,s]  ==  sum(model.vStorageInp[st1,c,r,y,s] for st1 in stg if (st1,c,r,y,s) in mvStorageStore)+sum(model.vStorageAInp[st1,c,r,y,s] for st1 in stg if (st1,c,r,y,s) in mvStorageAInp));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqStorageOutTot ", end = "")
# eqStorageOutTot(comm, region, year, slice)$mStorageOutTot(comm, region, year, slice)
model.eqStorageOutTot = Constraint(mStorageOutTot, rule = lambda model, c, r, y, s : model.vStorageOutTot[c,r,y,s]  ==  sum(model.vStorageOut[st1,c,r,y,s] for st1 in stg if (st1,c,r,y,s) in mvStorageStore)+sum(model.vStorageAOut[st1,c,r,y,s] for st1 in stg if (st1,c,r,y,s) in mvStorageAOut));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqCost ", end = "")
# eqCost(region, year)$mvTotalCost(region, year)
model.eqCost = Constraint(mvTotalCost, rule = lambda model, r, y : model.vTotalCost[r,y]  ==  sum(model.vTechEac[t,r,y] for t in tech if (t,r,y) in mTechEac)+sum(model.vTechOMCost[t,r,y] for t in tech if (t,r,y) in mTechOMCost)+sum(model.vSupCost[s1,r,y] for s1 in sup if (s1,r,y) in mvSupCost)+sum(pDummyImportCost.get((c,r,y,s))*model.vDummyImport[c,r,y,s] for c in comm for s in slice if (c,r,y,s) in mDummyImport)+sum(pDummyExportCost.get((c,r,y,s))*model.vDummyExport[c,r,y,s] for c in comm for s in slice if (c,r,y,s) in mDummyExport)+sum(model.vTaxCost[c,r,y] for c in comm if (c,r,y) in mTaxCost)-sum(model.vSubsCost[c,r,y] for c in comm if (c,r,y) in mSubCost)+sum(model.vStorageOMCost[st1,r,y] for st1 in stg if (st1,r,y) in mStorageOMCost)+sum(model.vStorageEac[st1,r,y] for st1 in stg if (st1,r,y) in mStorageEac)+(model.vTradeCost[r,y] if (r,y) in mvTradeCost else 0)+(model.vTotalUserCosts[r,y] if (r,y) in mvTotalUserCosts else 0));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqTaxCost ", end = "")
# eqTaxCost(comm, region, year)$mTaxCost(comm, region, year)
model.eqTaxCost = Constraint(mTaxCost, rule = lambda model, c, r, y : model.vTaxCost[c,r,y]  ==  sum(pTaxCostOut.get((c,r,y,s))*model.vOutTot[c,r,y,s] for s in slice if ((c,r,y,s) in mvOutTot and (c,s) in mCommSlice))+sum(pTaxCostInp.get((c,r,y,s))*model.vInpTot[c,r,y,s] for s in slice if ((c,r,y,s) in mvInpTot and (c,s) in mCommSlice))+sum(pTaxCostBal.get((c,r,y,s))*model.vBalance[c,r,y,s] for s in slice if ((c,r,y,s) in mvBalance and (c,s) in mCommSlice)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqSubsCost ", end = "")
# eqSubsCost(comm, region, year)$mSubCost(comm, region, year)
model.eqSubsCost = Constraint(mSubCost, rule = lambda model, c, r, y : model.vSubsCost[c,r,y]  ==  sum(pSubCostOut.get((c,r,y,s))*model.vOutTot[c,r,y,s] for s in slice if ((c,r,y,s) in mvOutTot and (c,s) in mCommSlice))+sum(pSubCostInp.get((c,r,y,s))*model.vInpTot[c,r,y,s] for s in slice if ((c,r,y,s) in mvInpTot and (c,s) in mCommSlice))+sum(pSubCostBal.get((c,r,y,s))*model.vBalance[c,r,y,s] for s in slice if ((c,r,y,s) in mvBalance and (c,s) in mCommSlice)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqObjective ", end = "")
# eqObjective
model.eqObjective = Constraint(rule = lambda model : model.vObjective  ==  sum(model.vTotalCost[r,y]*pDiscountFactorMileStone.get((r,y)) for r in region for y in year if (r,y) in mvTotalCost));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
if verbose: print("eqLECActivity ", end = "")
# eqLECActivity(tech, region, year)$meqLECActivity(tech, region, year)
model.eqLECActivity = Constraint(meqLECActivity, rule = lambda model, t, r, y : sum(model.vTechAct[t,r,y,s] for s in slice if (t,s) in mTechSlice)  >=  pLECLoACT.get((r)));
if verbose: print(datetime.datetime.now().strftime("%H:%M:%S"), " (", round(time.time() - seconds, 2), " s)", sep = "")
model.obj = Objective(rule = lambda model: model.vObjective, sense = minimize);
exec(open("inc3.py").read())
model.fornontriv = Var(domain = pyo.NonNegativeReals)
model.eqnontriv = Constraint(rule = lambda model: model.fornontriv == 0)
exec(open("inc_constraints.py").read())
exec(open("inc_costs.py").read())
exec(open("inc_solver.py").read())
# opt = SolverFactory('cplex');
exec(open("inc4.py").read())
flog.write('"solver",,"' + str(datetime.datetime.now().strftime("%H:%M:%S")) + '"\n')
print("solving... ");
slv = opt.solve(model, tee = True)
print("done " + str(datetime.datetime.now().strftime("%H:%M:%S")) + " (" + str(round(time.time() - seconds, 2)) + " s)");
flog.write('"solution status",' + str((slv.solver.status == SolverStatus.ok) *1) + ',"' + str(datetime.datetime.now().strftime("%H:%M:%S")) + '"\n')
flog.write('"export results",,"' + str(datetime.datetime.now().strftime("%H:%M:%S")) + '"\n')
exec(open("inc5.py").read())
exec(open("output.py").read())
flog.write('"done",,"' + str(datetime.datetime.now().strftime("%H:%M:%S")) + '"\n')
flog.close();
