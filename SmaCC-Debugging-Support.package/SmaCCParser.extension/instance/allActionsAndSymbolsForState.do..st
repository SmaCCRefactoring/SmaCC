*smacc-debugging-support
allActionsAndSymbolsForState: stateIndex do: aBlock
	self
		actionsAndSymbolsForState: stateIndex
		do: [ :action :symbol | 
			| row |
			(action bitAnd: self actionMask) = 2r11
				ifTrue: [ row := self ambiguousTransitions at: (action bitShift: -2).
					1 to: row size by: 2 do: [ :i | aBlock value: ((row at: i) bitShift: 8) + (row at: i + 1) value: symbol ] ]
				ifFalse: [ aBlock value: action value: symbol ] ]