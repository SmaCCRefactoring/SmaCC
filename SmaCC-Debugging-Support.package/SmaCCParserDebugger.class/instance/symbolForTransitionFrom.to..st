private
symbolForTransitionFrom: fromState to: toState
	| id |
	id := self symbolIdForTransitionFrom: fromState to: toState.
	^ self symbolLabelFor: id