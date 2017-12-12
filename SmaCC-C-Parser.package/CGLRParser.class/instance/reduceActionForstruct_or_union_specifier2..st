generated-reduction actions
reduceActionForstruct_or_union_specifier2: nodes
	| result |
	result := CGLRStructOrUnionSpecifierNode new.
	result prefix: (nodes at: 1).
	result lEFT_BRACEToken: (nodes at: 2).
	result addNodes: (nodes at: 3) to: result members.
	result rIGHT_BRACEToken: (nodes at: 4).
	^ result