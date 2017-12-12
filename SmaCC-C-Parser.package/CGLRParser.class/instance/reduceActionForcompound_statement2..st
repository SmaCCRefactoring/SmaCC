generated-reduction actions
reduceActionForcompound_statement2: nodes
	| result |
	result := CGLRCompoundStatementNode new.
	result lEFT_BRACEToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result statements.
	result rIGHT_BRACEToken: (nodes at: 3).
	^ result