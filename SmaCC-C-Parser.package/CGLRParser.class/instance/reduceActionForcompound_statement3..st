generated-reduction actions
reduceActionForcompound_statement3: nodes
	| result |
	result := CGLRCompoundStatementNode new.
	result lEFT_BRACEToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result declarations.
	result rIGHT_BRACEToken: (nodes at: 3).
	^ result