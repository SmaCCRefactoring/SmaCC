accessing
parseBlock: aString onError: aBlock 
	^self 
		parse: aString
		startingAt: self startingStateForBlock
		onError: aBlock