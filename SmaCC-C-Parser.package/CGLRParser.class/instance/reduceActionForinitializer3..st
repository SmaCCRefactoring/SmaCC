generated-reduction actions
reduceActionForinitializer3: nodes
	| result |
	result := CGLRInitializerNode new.
	result lEFT_BRACEToken: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result initializers.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result addToken: (nodes at: 3) to: result commaTokens.
	result rIGHT_BRACEToken: (nodes at: 4).
	^ result