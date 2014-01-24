accessing
startSymbol
	^self symbols detect: [:each | each isStartingSymbol] ifNone: [nil]