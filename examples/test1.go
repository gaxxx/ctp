package main

import (
	"ctp"
	"fmt"
)

var (
	front string = "tcp://asp-sim2-front1.financial-trading-platform.com:26205"
	api   ctp.CThostFtdcTraderApi
)

type TradeApi struct {
	ctp.ThostFtdcTraderSpiImplBase
}

func (g *TradeApi) OnFrontConnected() {
	fmt.Printf("connected\n")
}

func main() {
	api = ctp.CThostFtdcTraderApiCreateFtdcTraderApi()
	api.RegisterSpi(ctp.GTrader(&TradeApi{}))
	api.RegisterFront(front)
	api.Init()
	api.Join()
}
