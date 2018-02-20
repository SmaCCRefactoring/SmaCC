private
symbolForTransitionFrom: fromState to: toState
	| id |
	id := self symbolIdForTransitionFrom: fromState to: toState.
	^ host symbolNames at: id ifAbsent: [ '?' ]