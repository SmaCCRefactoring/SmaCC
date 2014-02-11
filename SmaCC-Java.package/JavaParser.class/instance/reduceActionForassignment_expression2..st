generated-reduction actions
reduceActionForassignment_expression2: nodes
	| result |
	result := JavaAssignmentExpressionNode new.
	result addTokens: (nodes at: 1) lefts to: result lefts.
	result addTokens: (nodes at: 1) rights to: result rights.
	result variable: (nodes at: 1) variable.
	result op: (nodes at: 1) op.
	result _value: (nodes at: 1) _value.
	^ result