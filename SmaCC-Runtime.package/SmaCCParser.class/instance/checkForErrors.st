error handling
checkForErrors
	"If we have an error correction installed, we might have handled the errors. If we did, we don't 
	want to return the result, so we raise a final exception that can't be proceeded."

	errorToken isNil
		ifTrue: [ ^ self ].
	currentToken := errorToken.
	self reportErrorMessage: 'Token not expected'