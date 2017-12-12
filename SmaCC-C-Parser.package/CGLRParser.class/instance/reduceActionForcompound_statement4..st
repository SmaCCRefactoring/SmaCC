generated-reduction actions
reduceActionForcompound_statement4: nodes
	| result |
	result := CGLRCompoundStatementNode new.
	result lEFT_BRACEToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result declarations.
	result addNodes: (nodes at: 3) to: result statements.
	result rIGHT_BRACEToken: (nodes at: 4).
	^ result