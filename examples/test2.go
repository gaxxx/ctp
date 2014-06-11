package main

import (
	"ctp"
	"fmt"
	"log"
	"strconv"
)

var (
	front      string = "tcp://asp-sim2-front1.financial-trading-platform.com:26205"
	api        ctp.CThostFtdcTraderApi
	brokerId   string = "2030"
	investorId string = "00069"
	password   string = "888888"
	seqId      int    = 0
)

type TradeApi struct {
	ctp.ThostFtdcTraderSpiImplBase
}

func isErrTradeApi(req ctp.CThostFtdcRspInfoField) bool {
	if req != nil && req.GetErrorID() != 0 {
		log.Printf("errid %d \n", req.GetErrorID())
		return true
	}
	return false
}

func (g *TradeApi) OnFrontConnected() {
	fmt.Printf("connected\n")
	req := ctp.NewCThostFtdcReqUserLoginField()
	req.SetBrokerID(brokerId)
	req.SetUserID(investorId)
	req.SetPassword(password)
	result := api.ReqUserLogin(req, seqId)
	seqId += 1
	fmt.Printf("result %d\n", result)
}

func (g *TradeApi) OnRspUserLogin(lf ctp.CThostFtdcRspUserLoginField, rf ctp.CThostFtdcRspInfoField, n int, isLast bool) {
	if isLast && !isErrTradeApi(rf) {
		frontId := lf.GetFrontID()
		sessionId := lf.GetSessionID()
		log.Printf("front id %s , session %d\n", frontId, sessionId)
		nextRef, _ := strconv.Atoi(lf.GetMaxOrderRef())
		nextRef += 1

		req := ctp.NewCThostFtdcSettlementInfoConfirmField()
		req.SetBrokerID(brokerId)
		req.SetInvestorID(investorId)
		api.ReqSettlementInfoConfirm(req, seqId)
		seqId += 1
	}
}

func (g *TradeApi) OnRspSettlementInfoConfirm(arg2 ctp.CThostFtdcSettlementInfoConfirmField, arg3 ctp.CThostFtdcRspInfoField, arg4 int, arg5 bool) {
	log.Printf("on confirm\n")
}

func main() {
	api = ctp.CThostFtdcTraderApiCreateFtdcTraderApi()
	api.RegisterSpi(ctp.GTrader(&TradeApi{}))
	api.RegisterFront(front)
	api.Init()
	api.Join()
}
