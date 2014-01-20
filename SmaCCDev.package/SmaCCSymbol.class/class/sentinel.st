instance creation
sentinel
	SentinelSymbol isNil 
		ifTrue: [SentinelSymbol := SmaCCTerminalSymbol name: 'S e n t i n e l'].
	^SentinelSymbol