private
reduceTableIndexFor: aSmaCCSymbol rhs: aSmaCCRHS 
	| index |
	index := 0.
	self symbols do: 
			[:each | 
			each = aSmaCCSymbol ifTrue: [^index + (each positionOf: aSmaCCRHS)].
			index := index + each size].
	^0