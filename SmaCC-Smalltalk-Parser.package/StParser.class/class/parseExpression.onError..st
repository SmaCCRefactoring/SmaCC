accessing
parseExpression: aString onError: aBlock
	^ self
		simplifyExpression:
			(self
				parse: aString
				startingAt: self startingStateForSequenceNode
				onError: aBlock)