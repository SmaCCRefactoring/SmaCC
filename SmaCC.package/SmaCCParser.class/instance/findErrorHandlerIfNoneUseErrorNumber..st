private
findErrorHandlerIfNoneUseErrorNumber: anInteger 
	| handlerStates index startingErrorToken newStack |
	handlerStates := self errorHandlerStates reverse.
	startingErrorToken := currentToken.
	
	[index := (1 to: handlerStates size) detect: 
					[:each | 
					| state |
					state := handlerStates at: each.
					state ~= 0 and: 
							[newStack := stateStack copyFrom: 1 to: handlerStates size - each + 1.
							newStack add: state.
							self willShift: newStack]]
				ifNone: [nil].
	index isNil] 
			whileTrue: 
				[self dismissErrorToken.
				self isEOFToken 
					ifTrue: 
						[currentToken := startingErrorToken.
						self reportError: anInteger]].
	index - 1 timesRepeat: [self dismissStackTopForErrorRecovery].
	stateStack addLast: (handlerStates at: index).
	nodeStack addLast: startingErrorToken