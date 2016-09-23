private
actionsForCurrentToken
	| actions |
	actions := OrderedCollection new: 1.
	self tryAllTokens
		ifTrue: [ currentToken ids
				do: [ :each | self addActionsFor: each to: actions ] ]
		ifFalse: [ self addActionsFor: currentToken ids first to: actions ].
	^ actions