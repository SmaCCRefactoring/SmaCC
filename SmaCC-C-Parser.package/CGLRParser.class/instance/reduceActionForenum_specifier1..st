generated-reduction actions
reduceActionForenum_specifier1: nodes
	| result |
	result := CGLREnumNode new.
	result enumToken: (nodes at: 1).
	result lEFT_BRACEToken: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result enumerators.
	result addTokens: ((nodes at: 3) at: 2) to: result commaTokens.
	result rIGHT_BRACEToken: (nodes at: 4).
	^ result