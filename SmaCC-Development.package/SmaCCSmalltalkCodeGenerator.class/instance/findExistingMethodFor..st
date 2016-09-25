reduction table
findExistingMethodFor: aRBMethodNode
	| potentialSelectors |
	potentialSelectors := #(#liftFirstValue: #liftLastValue: #liftSecondValue: #nil #stringValue:)
		asSet.
	potentialSelectors
		addAll: (self parserClass selectors select: [ :each | each numArgs <= 1 ]).
	^ potentialSelectors
		detect:
			[ :each | 
			| parseTree |
			parseTree := self parserParseTreeFor: each.
			parseTree notNil
				and:
					[ aRBMethodNode body
						equalTo: parseTree body
						exceptForVariables: aRBMethodNode argumentNames ] ]
		ifNone: [ nil ]