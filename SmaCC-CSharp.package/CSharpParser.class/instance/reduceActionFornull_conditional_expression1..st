generated-reduction actions
reduceActionFornull_conditional_expression1: nodes
	| result |
	result := CSNullConditionalExpressionNode new.
	result expression: (nodes at: 1).
	result nullConditionalOperation: (nodes at: 2).
	^ result