testing
isValidCode
	RBParser
		parseExpression: outputStream contents
		onError: [ :s :p | ^ false ].
	^ true