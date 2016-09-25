generated-reduction actions
reduceActionForreturn_statement1: nodes
	| result |
	result := SwiftReturnStatementNode new.
	result returnToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result