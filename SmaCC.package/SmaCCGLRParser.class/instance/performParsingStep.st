private
performParsingStep
	| actions action |
	currentState isAccepted ifTrue: [^self].
	self restoreState: currentState.
	(tryAllStates and: [self isEOFToken]) ifTrue: [^self processEOFToken].
	currentToken isPattern ifTrue: [^self splitForPatternToken].
	[actions := self actionsForCurrentToken.
	actions isEmpty
		ifTrue:
			[self killState.
			currentToken := nil.
			^self].
	2 to: actions size do: [:i | self splitWithAction: (actions at: i)].
	action := actions first.
	action = self acceptAction
		or:
			[self performAction: action.
			currentToken isNil]] whileFalse.
	action = self acceptAction ifTrue: [currentState markAccepted]