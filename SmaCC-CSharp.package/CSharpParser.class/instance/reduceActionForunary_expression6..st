generated-reduction actions
reduceActionForunary_expression6: nodes
	| result |
	result := CSPrefixExpressionNode new.
	result operator: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result