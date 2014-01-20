private
processEOFToken
	| performedActions token |
	performedActions := Set new.
	token := currentToken.
	self symbolTypes
		keysAndValuesDo:
			[:i :each | 
			| actions |
			(each = #SmaCCToken and: [i ~= scanner errorTokenId])
				ifTrue:
					[actions := OrderedCollection new.
					self addActionsFor: i to: actions.
					actions
						do:
							[:action | 
							(performedActions includes: action)
								ifFalse:
									[performedActions add: action.
									(action bitAnd: self actionMask) = self reduceAction
										ifTrue:
											[currentToken := token.
											self splitWithAction: action]]]]].
	(nodeStack size = 1 and: [nodeStack first isKindOf: SmaCCParseNode])
		ifTrue: [currentState markAccepted]
		ifFalse: [self killState]