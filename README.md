ctp
===
ctp ineterface of golang (for linux64)
http://www.citicsf.com/download/ctp/



Preparing
---------
	install go
	install swig


Building
--------
	export GOROOT=<your go root path>
	cd ./src
	./make.sh

Tutorial
--------
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
	
	//callback from c++ libararys
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


More
----

	i need a public account to test...
	and i don't know how to trade...






