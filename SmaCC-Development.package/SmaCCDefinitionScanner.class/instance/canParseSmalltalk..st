public
canParseSmalltalk: aString
	RBParser parseExpression: aString onError: [ :error :pos | ^ false ].
	^ true