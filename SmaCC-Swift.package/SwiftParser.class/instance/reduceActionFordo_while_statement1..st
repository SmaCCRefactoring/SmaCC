generated-reduction actions
reduceActionFordo_while_statement1: nodes
	| result |
	result := SwiftDoWhileStatementNode new.
	result doToken: (nodes at: 1).
	result block: (nodes at: 2).
	result whileToken: (nodes at: 3).
	^ result