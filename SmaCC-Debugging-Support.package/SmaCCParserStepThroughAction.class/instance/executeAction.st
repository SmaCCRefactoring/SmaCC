actions
executeAction
	| insidePerform performBlock |
	performBlock := [ :context | (context receiver isKindOf: SmaCCParser) and: [ context selector = #performAction: ] ].
	insidePerform := (self session context findContextSuchThat: performBlock) notNil.
	self
		stepUntil: [ :context | 
			insidePerform
				ifTrue: [ (context findContextSuchThat: performBlock) isNil ]
				ifFalse: [ insidePerform := performBlock value: context.
					false ] ]