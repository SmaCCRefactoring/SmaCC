generated-reduction actions
reduceActionForwhile_statement1: nodes
	| result |
	result := SwiftWhileStatementNode new.
	result whileToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result block: (nodes at: 3).
	^ result