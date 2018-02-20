accessing
executeAction
	| token |
	token := self session parser currentToken.
	self
		stepUntil: [ :context | 
			self session parser isEOFToken
				or: [ self session parser currentToken ~~ token
						and: [ self session parser currentToken notNil ] ] ]