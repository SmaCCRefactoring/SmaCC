generated-reduction actions
reduceActionForif_statement1: nodes
	| result |
	result := SwiftIfStatementNode new.
	result ifToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result then: (nodes at: 3).
	result elseToken: ((nodes at: 4) at: 1).
	result else: ((nodes at: 4) at: 2).
	^ result