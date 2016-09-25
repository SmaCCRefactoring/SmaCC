generated-reduction actions
reduceActionForstatement1: nodes
	| result |
	result := SwiftExpressionStatementNode new.
	result expression: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result