accessing
errorSymbol
	^errorSymbol ifNil: [errorSymbol := self newTerminalSymbolNamed: 'error']