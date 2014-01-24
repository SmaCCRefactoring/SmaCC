private
statesThatShift
	^(1 to: self transitionTable size)
		select:
			[:each | 
			(1 to: self symbolTypes size)
				anySatisfy:
					[:i | 
					| actions |
					actions := OrderedCollection new.
					self
						addActionsForState: each
						symbol: i
						to: actions.
					actions anySatisfy: [:action | (action bitAnd: self actionMask) = self shiftAction]]]