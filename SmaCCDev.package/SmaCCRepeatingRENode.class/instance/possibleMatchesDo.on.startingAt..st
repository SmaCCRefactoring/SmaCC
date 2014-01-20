private
possibleMatchesDo: aBlock on: aStream startingAt: anInteger 
	(anInteger between: minimumMatches and: maximumMatches) 
		ifTrue: [aBlock value].
	anInteger < maximumMatches 
		ifTrue: 
			[node possibleMatchesDo: 
					[self 
						possibleMatchesDo: aBlock
						on: aStream
						startingAt: anInteger + 1]
				on: aStream]