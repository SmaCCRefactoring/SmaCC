generated-reduction actions
reduceActionForcompound_statement1: nodes
	| result |
	result := CGLRCompoundStatementNode new.
	result lEFT_BRACEToken: (nodes at: 1).
	result rIGHT_BRACEToken: (nodes at: 2).
	^ result