private-error handling
hasErrorHandler
	^self errorHandlerStates anySatisfy: [:each | each ~~ 0]