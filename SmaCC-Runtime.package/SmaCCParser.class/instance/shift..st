private
shift: stateIndex
	stateStack addLast: stateIndex.
	nodeStack addLast: currentToken.
	currentToken := nil