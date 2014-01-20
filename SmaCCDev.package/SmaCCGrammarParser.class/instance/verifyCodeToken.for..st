private
verifyCodeToken: codeToken for: aSmaCCRHS 
	| code |
	code := codeToken value copyFrom: 2 to: codeToken value size - 1.
	RBParser parseExpression: code
		onError: 
			[:string :position | 
			currentToken := nil.
			scanner position: codeToken startPosition + position.
			self reportErrorMessage: string].
	aSmaCCRHS reduceAction: code.
	^aSmaCCRHS