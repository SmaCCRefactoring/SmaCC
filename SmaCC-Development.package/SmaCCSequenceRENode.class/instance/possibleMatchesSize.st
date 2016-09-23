accessing
possibleMatchesSize
	^ nodes
		inject: 1
		into: [ :sum :each | sum * each possibleMatchesSize ]