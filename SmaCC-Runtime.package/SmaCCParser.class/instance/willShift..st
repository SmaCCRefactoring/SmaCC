error handling
willShift: potentialStateStack
	| action compoundAction reduceEntry size |
	compoundAction := self
		actionForState: potentialStateStack last
		and: currentToken ids first.
	action := compoundAction bitAnd: self actionMask.
	action == self shiftAction
		ifTrue: [ ^ true ].
	action == self reduceAction
		ifTrue:
			[ reduceEntry := self reduceTable at: (compoundAction bitShift: -2).
			size := reduceEntry at: 2.
			size timesRepeat: [ potentialStateStack removeLast ].
			potentialStateStack
				add:
					((self
						actionForState: potentialStateStack last
						and: (reduceEntry at: 1)) bitShift: -2).
			^ self willShift: potentialStateStack ].
	^ false