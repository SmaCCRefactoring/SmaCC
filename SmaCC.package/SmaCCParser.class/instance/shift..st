private
shift: stateIndex 
	stateStack add: stateIndex.
	nodeStack add: currentToken.
	currentToken := nil