accessing
addStartingSymbol: aSmaCCSymbol
	(otherStartingSymbols includes: aSmaCCSymbol)
		ifFalse: [ otherStartingSymbols add: aSmaCCSymbol ]