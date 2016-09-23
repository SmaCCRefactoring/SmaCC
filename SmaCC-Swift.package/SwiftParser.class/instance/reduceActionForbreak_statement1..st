generated-reduction actions
reduceActionForbreak_statement1: nodes
	| result |
	result := SwiftBreakStatementNode new.
	result breakToken: (nodes at: 1).
	result name: (nodes at: 2).
	^ result