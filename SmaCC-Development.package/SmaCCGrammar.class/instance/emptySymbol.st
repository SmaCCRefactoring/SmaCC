accessing
emptySymbol
	^ emptySymbol
		ifNil: [ emptySymbol := self newTerminalSymbolNamed: 'E O F' ]