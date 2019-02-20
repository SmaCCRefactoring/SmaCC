actions
executeAction
	| token |
	token := self session parser currentToken.
	self stepUntil: [ :context | self session parser currentToken ~~ token and: [ self session parser currentToken notNil ] ]