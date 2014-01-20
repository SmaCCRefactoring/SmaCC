accessing
parseExpression: aString 
	^self simplifyExpression: (self parse: aString
				startingAt: self startingStateForSequenceNode)