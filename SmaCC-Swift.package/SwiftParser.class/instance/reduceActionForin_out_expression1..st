generated-reduction actions
reduceActionForin_out_expression1: nodes
	| result |
	result := SwiftInOutExpressionNode new.
	result andToken: (nodes at: 1).
	result identifierToken: (nodes at: 2).
	^ result