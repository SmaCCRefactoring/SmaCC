generated-reduction actions
reduceActionForExpression1: nodes
	| result |
	result := SmaCCCompositeReplaceExpression new.
	result addNodes: (nodes at: 1) to: result expressions.
	^ result