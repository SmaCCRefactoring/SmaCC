generated-reduction actions
reduceActionForenum_specifier2: nodes
	| result |
	result := CGLREnumNode new.
	result enumToken: (nodes at: 1).
	result identifier: (nodes at: 2).
	result lEFT_BRACEToken: (nodes at: 3).
	result addNodes: ((nodes at: 4) at: 1) to: result enumerators.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result rIGHT_BRACEToken: (nodes at: 5).
	^ result