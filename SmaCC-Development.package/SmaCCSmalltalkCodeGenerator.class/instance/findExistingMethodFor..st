reduction table
findExistingMethodFor: aRBMethodNode
	| potentialSelectors aClass |
	potentialSelectors := #(#liftFirstValue: #liftLastValue: #liftSecondValue: #nil #stringValue:)
		asSet.
	aClass := self parserClass.
	[ aClass name = 'SmaCCParser' ]
		whileFalse: [ (aClass selectors select: [ :each | each numArgs <= 1 ])
				do: [ :each | 
					| parseTree |
					parseTree := self parserParseTreeFor: each.
					(parseTree notNil
						and: [ aRBMethodNode body
								equalTo: parseTree body
								exceptForVariables: aRBMethodNode argumentNames ])
						ifTrue: [ ^ each ] ].
			aClass := aClass superclass ].
	#(#liftFirstValue: #liftLastValue: #liftSecondValue: #nil #stringValue:)
		do: [ :each | 
			| parseTree |
			parseTree := self parserParseTreeFor: each.
			(parseTree notNil
				and: [ aRBMethodNode body
						equalTo: parseTree body
						exceptForVariables: aRBMethodNode argumentNames ])
				ifTrue: [ ^ each ] ].
	^ nil