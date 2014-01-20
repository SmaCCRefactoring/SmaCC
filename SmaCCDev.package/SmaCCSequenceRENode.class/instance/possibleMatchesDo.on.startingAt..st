private
possibleMatchesDo: aBlock on: aStream startingAt: anInteger 
	| node |
	node := nodes at: anInteger.
	nodes size = anInteger 
		ifTrue: [node possibleMatchesDo: aBlock on: aStream]
		ifFalse: 
			[node possibleMatchesDo: 
					[self 
						possibleMatchesDo: aBlock
						on: aStream
						startingAt: anInteger + 1]
				on: aStream]