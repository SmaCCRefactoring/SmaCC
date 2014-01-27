private
isValidSmalltalk: aString
	RBParser parseExpression: aString onError: [ :e :p | ^ false ].
	^ true