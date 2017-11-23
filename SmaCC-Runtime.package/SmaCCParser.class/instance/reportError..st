error handling
reportError: anInteger
	self
		reportErrorMessage:
			(anInteger = 0
				ifTrue: [ 'Token ' , currentToken printString , ' not expected' ]
				ifFalse: [ self errorTable at: anInteger ])