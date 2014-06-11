//name of the resulting GO package
%module ctp %{
#include "ThostFtdcMdApi.h"
#include "ThostFtdcTraderApi.h"
#include "ThostFtdcUserApiDataType.h"
#include "ThostFtdcUserApiStruct.h"
#include "helper.h"
%}

%module(directors="1") CThostFtdcTraderSpi
%feature("director") CThostFtdcTraderSpi;

%insert(go_wrapper) %{

type GoThostFtdcTraderSpi struct {
	CThostFtdcTraderSpi
}

func GTrader(impl CThostFtdcTraderSpi) CThostFtdcTraderSpi {
	return NewDirectorCThostFtdcTraderSpi(&GoThostFtdcTraderSpi{impl})
}

type ThostFtdcTraderSpiImplBase  struct{}
func (p *ThostFtdcTraderSpiImplBase) Swigcptr() uintptr { return 0 }
func (p *ThostFtdcTraderSpiImplBase) SwigIsCThostFtdcTraderSpi() { }
func (p *ThostFtdcTraderSpiImplBase) DirectorInterface() interface{} { return nil }
func (p *ThostFtdcTraderSpiImplBase) OnFrontConnected() {}
func (p *ThostFtdcTraderSpiImplBase) OnFrontDisconnected(arg2 int) {}
func (p *ThostFtdcTraderSpiImplBase) OnHeartBeatWarning(arg2 int) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspAuthenticate(arg2 CThostFtdcRspAuthenticateField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspUserLogin(arg2 CThostFtdcRspUserLoginField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspUserLogout(arg2 CThostFtdcUserLogoutField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspUserPasswordUpdate(arg2 CThostFtdcUserPasswordUpdateField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspTradingAccountPasswordUpdate(arg2 CThostFtdcTradingAccountPasswordUpdateField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspOrderInsert(arg2 CThostFtdcInputOrderField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspParkedOrderInsert(arg2 CThostFtdcParkedOrderField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspParkedOrderAction(arg2 CThostFtdcParkedOrderActionField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspOrderAction(arg2 CThostFtdcInputOrderActionField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspQueryMaxOrderVolume(arg2 CThostFtdcQueryMaxOrderVolumeField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspSettlementInfoConfirm(arg2 CThostFtdcSettlementInfoConfirmField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspRemoveParkedOrder(arg2 CThostFtdcRemoveParkedOrderField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspRemoveParkedOrderAction(arg2 CThostFtdcRemoveParkedOrderActionField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryOrder(arg2 CThostFtdcOrderField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryTrade(arg2 CThostFtdcTradeField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryInvestorPosition(arg2 CThostFtdcInvestorPositionField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryTradingAccount(arg2 CThostFtdcTradingAccountField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool) {}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryInvestor(arg2 CThostFtdcInvestorField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryTradingCode(arg2 CThostFtdcTradingCodeField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryInstrumentMarginRate(arg2 CThostFtdcInstrumentMarginRateField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryInstrumentCommissionRate(arg2 CThostFtdcInstrumentCommissionRateField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryExchange(arg2 CThostFtdcExchangeField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryInstrument(arg2 CThostFtdcInstrumentField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryDepthMarketData(arg2 CThostFtdcDepthMarketDataField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQrySettlementInfo(arg2 CThostFtdcSettlementInfoField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryTransferBank(arg2 CThostFtdcTransferBankField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryInvestorPositionDetail(arg2 CThostFtdcInvestorPositionDetailField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryNotice(arg2 CThostFtdcNoticeField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQrySettlementInfoConfirm(arg2 CThostFtdcSettlementInfoConfirmField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryInvestorPositionCombineDetail(arg2 CThostFtdcInvestorPositionCombineDetailField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryCFMMCTradingAccountKey(arg2 CThostFtdcCFMMCTradingAccountKeyField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryEWarrantOffset(arg2 CThostFtdcEWarrantOffsetField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryTransferSerial(arg2 CThostFtdcTransferSerialField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryAccountregister(arg2 CThostFtdcAccountregisterField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspError(arg2 CThostFtdcRspInfoField, arg3 int, arg4 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnOrder(arg2 CThostFtdcOrderField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnTrade(arg2 CThostFtdcTradeField){}
func (p *ThostFtdcTraderSpiImplBase) OnErrRtnOrderInsert(arg2 CThostFtdcInputOrderField, arg3 CThostFtdcRspInfoField){}
func (p *ThostFtdcTraderSpiImplBase) OnErrRtnOrderAction(arg2 CThostFtdcOrderActionField, arg3 CThostFtdcRspInfoField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnInstrumentStatus(arg2 CThostFtdcInstrumentStatusField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnTradingNotice(arg2 CThostFtdcTradingNoticeInfoField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnErrorConditionalOrder(arg2 CThostFtdcErrorConditionalOrderField){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryContractBank(arg2 CThostFtdcContractBankField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryParkedOrder(arg2 CThostFtdcParkedOrderField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryParkedOrderAction(arg2 CThostFtdcParkedOrderActionField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryTradingNotice(arg2 CThostFtdcTradingNoticeField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryBrokerTradingParams(arg2 CThostFtdcBrokerTradingParamsField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQryBrokerTradingAlgos(arg2 CThostFtdcBrokerTradingAlgosField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnFromBankToFutureByBank(arg2 CThostFtdcRspTransferField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnFromFutureToBankByBank(arg2 CThostFtdcRspTransferField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnRepealFromBankToFutureByBank(arg2 CThostFtdcRspRepealField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnRepealFromFutureToBankByBank(arg2 CThostFtdcRspRepealField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnFromBankToFutureByFuture(arg2 CThostFtdcRspTransferField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnFromFutureToBankByFuture(arg2 CThostFtdcRspTransferField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnRepealFromBankToFutureByFutureManual(arg2 CThostFtdcRspRepealField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnRepealFromFutureToBankByFutureManual(arg2 CThostFtdcRspRepealField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnQueryBankBalanceByFuture(arg2 CThostFtdcNotifyQueryAccountField){}
func (p *ThostFtdcTraderSpiImplBase) OnErrRtnBankToFutureByFuture(arg2 CThostFtdcReqTransferField, arg3 CThostFtdcRspInfoField){}
func (p *ThostFtdcTraderSpiImplBase) OnErrRtnFutureToBankByFuture(arg2 CThostFtdcReqTransferField, arg3 CThostFtdcRspInfoField){}
func (p *ThostFtdcTraderSpiImplBase) OnErrRtnRepealBankToFutureByFutureManual(arg2 CThostFtdcReqRepealField, arg3 CThostFtdcRspInfoField){}
func (p *ThostFtdcTraderSpiImplBase) OnErrRtnRepealFutureToBankByFutureManual(arg2 CThostFtdcReqRepealField, arg3 CThostFtdcRspInfoField){}
func (p *ThostFtdcTraderSpiImplBase) OnErrRtnQueryBankBalanceByFuture(arg2 CThostFtdcReqQueryAccountField, arg3 CThostFtdcRspInfoField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnRepealFromBankToFutureByFuture(arg2 CThostFtdcRspRepealField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnRepealFromFutureToBankByFuture(arg2 CThostFtdcRspRepealField){}
func (p *ThostFtdcTraderSpiImplBase) OnRspFromBankToFutureByFuture(arg2 CThostFtdcReqTransferField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspFromFutureToBankByFuture(arg2 CThostFtdcReqTransferField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRspQueryBankAccountMoneyByFuture(arg2 CThostFtdcReqQueryAccountField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnOpenAccountByBank(arg2 CThostFtdcOpenAccountField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnCancelAccountByBank(arg2 CThostFtdcCancelAccountField){}
func (p *ThostFtdcTraderSpiImplBase) OnRtnChangeAccountByBank(arg2 CThostFtdcChangeAccountField){}

%}



%module(directors="2") CThostFtdcMdSpi
%feature("director") CThostFtdcMdSpi;

%insert(go_wrapper) %{
type GoThostFtdcMdSpi struct {
	CThostFtdcMdSpi
}

func GMd(impl CThostFtdcMdSpi) CThostFtdcMdSpi {
	return NewDirectorCThostFtdcMdSpi(&GoThostFtdcMdSpi{impl})
}

type ThostFtdcMdSpiImplBase struct {}


func (p *ThostFtdcMdSpiImplBase) Swigcptr() uintptr { return 0 }
func (p *ThostFtdcMdSpiImplBase) SwigIsCThostFtdcMdSpi() { }
func (p *ThostFtdcMdSpiImplBase) DirectorInterface() interface{} { return nil }
func (p *ThostFtdcMdSpiImplBase) OnFrontConnected(){}
func (p *ThostFtdcMdSpiImplBase) OnFrontDisconnected(arg2 int){}
func (p *ThostFtdcMdSpiImplBase) OnHeartBeatWarning(arg2 int){}
func (p *ThostFtdcMdSpiImplBase) OnRspUserLogin(arg2 CThostFtdcRspUserLoginField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcMdSpiImplBase) OnRspUserLogout(arg2 CThostFtdcUserLogoutField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcMdSpiImplBase) OnRspError(arg2 CThostFtdcRspInfoField, arg3 int, arg4 bool){}
func (p *ThostFtdcMdSpiImplBase) OnRspSubMarketData(arg2 CThostFtdcSpecificInstrumentField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcMdSpiImplBase) OnRspUnSubMarketData(arg2 CThostFtdcSpecificInstrumentField, arg3 CThostFtdcRspInfoField, arg4 int, arg5 bool){}
func (p *ThostFtdcMdSpiImplBase) OnRtnDepthMarketData(arg2 CThostFtdcDepthMarketDataField){}
%}


%include "../c++/ThostFtdcMdApi.h"
%include "../c++/ThostFtdcTraderApi.h"
%include "../c++/ThostFtdcUserApiDataType.h"
%include "../c++/ThostFtdcUserApiStruct.h"
%include "../helper/helper.h"

