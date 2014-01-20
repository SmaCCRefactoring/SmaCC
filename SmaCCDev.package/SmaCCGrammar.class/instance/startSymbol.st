accessing
startSymbol
	^symbols detect: [:each | each isStartingSymbol] ifNone: [nil]