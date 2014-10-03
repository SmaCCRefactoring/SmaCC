accessing
index
	index isNil
		ifTrue: [ 
			rhs size to: 1 by: -1 do: [ :i | 
				(rhs at: i) isTerminal
					ifFalse: [ index := i ] ].
			index isNil
				ifTrue: [ index := 1 min: rhs size ].
			(rhs size = index and: [ index <= 1 ])
				ifFalse: [ self signalNodeCreationWarning ] ].
	^ index