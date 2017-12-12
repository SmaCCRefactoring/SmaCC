generated-reduction actions
reduceActionForenum_specifier3: nodes
	| result |
	result := CGLREnumNode new.
	result enumToken: (nodes at: 1).
	result identifier: (nodes at: 2).
	^ result