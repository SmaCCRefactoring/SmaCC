private
addActionsForState: state symbol: anInteger to: anOrderedCollection
	| action |
	action := self actionForState: state and: anInteger.
	action = self errorAction
		ifTrue: [ ^ self ].
	(self isAmbiguous: action)
		ifTrue: [ self
				ambiguousTransitionsAt: (action bitShift: -2)
				into: anOrderedCollection ]
		ifFalse: [ self addAction: action to: anOrderedCollection ]