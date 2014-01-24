error
hasErrorHandler
	^self errorHandlerStates anySatisfy: [:each | each ~~ 0]