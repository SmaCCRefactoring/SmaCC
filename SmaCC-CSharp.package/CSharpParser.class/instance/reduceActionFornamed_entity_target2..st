generated-reduction actions
reduceActionFornamed_entity_target2: nodes
	| result |
	result := CSBaseExpressionNode new.
	result baseToken: (nodes at: 1).
	^ result