public
canParseSmalltalk: aString
	SmalltalkParser parseExpression: aString onError: [:error :pos | ^false].
	^true