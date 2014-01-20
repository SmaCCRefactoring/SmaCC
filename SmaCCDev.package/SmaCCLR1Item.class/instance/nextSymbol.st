accessing
nextSymbol
	^location > rhs size 
		ifTrue: [SmaCCSymbol sentinel]
		ifFalse: [rhs at: location]