accessing
parseMethod: aString onError: aBlock 
	^self 
		parse: aString
		startingAt: self startingStateForMethod
		onError: aBlock