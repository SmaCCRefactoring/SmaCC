accessing
index
	index isNil
		ifTrue:
			[rhs size = 0
				ifTrue: [index := 0]
				ifFalse:
					[rhs size
						to: 1
						by: -1
						do: [:i | (rhs at: i) isTerminal ifFalse: [index := i]].
					index isNil ifTrue: [index := 1]]].
	^index