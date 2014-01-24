private
addActionsFor: anInteger to: anOrderedCollection
	| state |
	state := self currentState.
	self
		addActionsForState: state
		symbol: anInteger
		to: anOrderedCollection