generated-reduction actions
reduceActionForinterpolated_string_expression1: nodes
	| result |
	result := CSInterpolatedStringExpressionNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result stringParts.
	result addNodes: ((nodes at: 1) at: 2) to: result interpolations.
	^ result