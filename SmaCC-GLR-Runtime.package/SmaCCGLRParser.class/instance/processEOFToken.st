private
processEOFToken
	| originalState performed eofToken |
	currentState isAccepted
		ifTrue: [ ^ self ].
	eofToken := currentToken.
	originalState := currentState.
	performed := Set new.
	self
		reduceActionsDo: [ :each | 
			(performed includes: each)
				ifFalse: [ performed add: each.
					self restoreState: self duplicateState.
					currentToken := eofToken.
					self performAction: each.
					(nodeStack size = 1 and: [ nodeStack first isKindOf: SmaCCParseNode ])
						ifTrue: [ currentState markAccepted ]
						ifFalse: [ self killState ].
					self restoreState: originalState ] ].
	currentToken := eofToken.
	(nodeStack size = 1 and: [ nodeStack first isKindOf: SmaCCParseNode ])
		ifTrue: [ currentState markAccepted ]
		ifFalse: [ self killState ]