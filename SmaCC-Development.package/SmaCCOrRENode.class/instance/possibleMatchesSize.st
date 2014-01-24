accessing
possibleMatchesSize
	^nodes inject: 0 into: [:sum :each | sum + each possibleMatchesSize]