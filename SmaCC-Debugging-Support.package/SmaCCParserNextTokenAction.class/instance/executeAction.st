accessing
executeAction
	| token |
	token := self session parser currentToken.
	self
		stepUntil: [ :context | 
			(context
				findContextSuchThat:
					[ :each | (each receiver isKindOf: SmaCCParser) and: [ each selector = #parse ] ])
				isNil
				or: [ self session parser currentToken ~~ token
						and: [ self session parser currentToken notNil ] ] ]