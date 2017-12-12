generated-reduction actions
reduceActionForstruct_or_union_specifier1: nodes
	| result |
	result := CGLRStructOrUnionSpecifierNode new.
	result prefix: (nodes at: 1).
	result symbol: (nodes at: 2).
	result lEFT_BRACEToken: (nodes at: 3).
	result addNodes: (nodes at: 4) to: result members.
	result rIGHT_BRACEToken: (nodes at: 5).
	^ result