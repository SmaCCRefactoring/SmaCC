accessing
nextSymbol
	^location > rhs size ifTrue: [self grammar sentinelSymbol] ifFalse: [rhs at: location]