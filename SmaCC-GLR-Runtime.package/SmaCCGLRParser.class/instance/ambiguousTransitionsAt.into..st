private
ambiguousTransitionsAt: anIndex into: anOrderedCollection
	| ambiguousTransitions |
	ambiguousTransitions := self ambiguousTransitions at: anIndex.
	1 to: ambiguousTransitions size by: 2 do:
		[ :i | 
		self
			addAction:
				((ambiguousTransitions at: i) bitShift: 8)
					+ (ambiguousTransitions at: i + 1)
			to: anOrderedCollection ]