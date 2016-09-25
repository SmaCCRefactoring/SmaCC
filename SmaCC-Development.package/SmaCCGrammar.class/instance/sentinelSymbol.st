accessing
sentinelSymbol
	^ sentinelSymbol
		ifNil: [ sentinelSymbol := self newTerminalSymbolNamed: 'S e n t i n e l' ]