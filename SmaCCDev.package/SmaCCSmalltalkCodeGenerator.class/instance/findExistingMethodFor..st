private
findExistingMethodFor: aRBMethodNode
	| potentialSelectors smaccParserClass |
	smaccParserClass := model classFor: SmaCCParser.
	potentialSelectors := Set withAll: (self parserClass selectors select: [ :each | each argumentCount <= 1 ]).
	potentialSelectors addAll: (smaccParserClass selectors select: [ :each | each argumentCount <= 1 ]).
	^ potentialSelectors
		detect: [ :each | 
			| parseTree |
			parseTree := self parserParseTreeFor: each.
			parseTree notNil and: [ aRBMethodNode body equalTo: parseTree body exceptForVariables: aRBMethodNode argumentNames ] ]
		ifNone: [ nil ]