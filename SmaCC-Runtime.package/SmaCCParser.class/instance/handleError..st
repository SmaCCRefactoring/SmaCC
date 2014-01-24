error
handleError: anInteger
	errorToken isNil ifTrue: [errorToken := currentToken].
	(self isEOFToken or: [self hasErrorHandler not]) ifTrue: [self reportError: anInteger].
	self findErrorHandlerIfNoneUseErrorNumber: anInteger