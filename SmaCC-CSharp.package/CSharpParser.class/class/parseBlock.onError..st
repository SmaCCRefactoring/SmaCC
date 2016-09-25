accessing
parseBlock: aString onError: aBlock
	^ self
		parse: aString
		startingAt: self startingStateForblock
		onError: aBlock