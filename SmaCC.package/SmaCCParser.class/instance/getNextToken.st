private
getNextToken
	currentToken isNil ifTrue: [currentToken := scanner next]