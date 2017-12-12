generated-reduction actions
reduceActionForprimary_expression4: nodes
	| result |
	result := CGLRParenthesizedExpressionNode new.
	result leftParenToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result