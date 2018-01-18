private
actionsAndSymbolsForState: stateIndex do: aBlock
	| action bytes |
	bytes := host transitionTable at: stateIndex.
	(bytes at: 1) = 0
		ifTrue: [ action := ((bytes at: 2) bitShift: 8) + (bytes at: 3).
			4 to: bytes size by: 2 do: [ :i | 
				aBlock
					value: action
					value: ((bytes at: i) bitShift: 8) + (bytes at: i + 1) ] ]
		ifFalse: [ 2 to: bytes size by: 4 do: [ :i | 
				aBlock
					value: ((bytes at: i) bitShift: 8) + (bytes at: i + 1)
					value: ((bytes at: i + 2) bitShift: 8) + (bytes at: i + 3) ] ]