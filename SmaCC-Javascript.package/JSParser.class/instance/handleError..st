private
handleError: anInteger
	(currentToken value = ';' and: [ currentToken startPosition isNil ])
		ifTrue: [ 
			currentToken := nil.
			self getNextToken ].
	^ super handleError: anInteger