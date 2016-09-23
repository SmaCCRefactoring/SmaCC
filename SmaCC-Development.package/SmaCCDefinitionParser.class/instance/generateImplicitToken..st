private
generateImplicitToken: aSmaCCToken
	| node |
	node := SmaCCGrammar implicitToken: aSmaCCToken value.
	node isNil
		ifTrue:
			[ currentToken := aSmaCCToken.
			self reportErrorMessage: 'Token not specified' ].
	^ node