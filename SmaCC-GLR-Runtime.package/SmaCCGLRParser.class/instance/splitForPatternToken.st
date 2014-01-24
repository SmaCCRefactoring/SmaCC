private
splitForPatternToken
	| token patternNode performedActions nodeClass |
	performedActions := Set new.
	token := currentToken copy.
	token ids: OrderedCollection new.
	patternNode := SmaCCPatternNode onToken: token copy.
	nodeClass := token nodeClassName
		ifNil: [SmaCCParseNode]
		ifNotNil: [:name | self class environment at: name ifAbsent: [SmaCCParseNode]].
	self symbolTypes
		keysAndValuesDo:
			[:i :each | 
			| actions |
			(i ~= scanner emptySymbolTokenId and: [i ~= scanner errorTokenId])
				ifTrue:
					[actions := OrderedCollection new.
					(each = #SmaCCToken or: [(self class environment at: each ifAbsent: [Object]) includesBehavior: nodeClass])
						ifTrue:
							[self addActionsFor: i to: actions.
							actions
								do:
									[:action | 
									(performedActions includes: action)
										ifFalse:
											[performedActions add: action.
											each = #SmaCCToken
												ifTrue:
													[token ids add: i.
													((action bitAnd: self actionMask) = self reduceAction or: [token isToken])
														ifTrue:
															[currentToken := token.
															self splitWithAction: action]]
												ifFalse:
													[token isNode
														ifTrue:
															[currentToken := nil.
															self duplicateState.
															stateStack addLast: (action bitShift: -2).
															nodeStack addLast: patternNode.
															self restoreState: currentState]]]]]]].
	self killState.
	currentToken := nil