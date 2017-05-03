private
symbolForTransitionFrom: fromState to: toState
	| id |
	id := self parser symbolIdForTransitionFrom: fromState to: toState.
	^ self parser symbolNameFor: id