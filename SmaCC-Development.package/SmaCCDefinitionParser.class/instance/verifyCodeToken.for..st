private
verifyCodeToken: codeToken for: aSmaCCRHS
	| code |
	code := codeToken value copyFrom: 2 to: codeToken value size - 1.
	RBParser
		parseExpression: code
		onError:
			[ :string :position | 
			currentToken := nil.
			self position: codeToken startPosition + position.
			self reportErrorMessage: string ].
	aSmaCCRHS reduceActionSource: code.
	^ aSmaCCRHS