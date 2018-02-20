private
symbolIdForTransitionFrom: fromState to: toState
	| parser toValue |
	parser := host.
	toValue := (toState bitShift: 2) bitOr: parser shiftAction.
	self
		actionsAndSymbolsForState: fromState
		do: [ :action :symbol | 
			| row |
			toValue = action
				ifTrue: [ ^ symbol ].
			(action bitAnd: parser actionMask) = 2r11
				ifTrue: [ row := parser ambiguousTransitions at: (action bitShift: -2).
					1 to: row size by: 2 do: [ :i | 
						((row at: i) bitShift: 8) + (row at: i + 1) = toValue
							ifTrue: [ ^ symbol ] ] ] ].
	^ 0