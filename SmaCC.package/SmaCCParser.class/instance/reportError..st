error
reportError: anInteger
	self reportErrorMessage: (anInteger = 0 ifTrue: ['Token not expected'] ifFalse: [self errorTable at: anInteger])