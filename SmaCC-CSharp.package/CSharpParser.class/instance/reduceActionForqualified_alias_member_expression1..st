generated-reduction actions
reduceActionForqualified_alias_member_expression1: nodes
	| result |
	result := CSTypeExpressionNode new.
	result type: (nodes at: 1).
	^ result