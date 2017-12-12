generated-reduction actions
reduceActionForstruct_or_union_specifier3: nodes
	| result |
	result := CGLRStructOrUnionSpecifierNode new.
	result prefix: (nodes at: 1).
	result symbol: (nodes at: 2).
	^ result