generated-reduction actions
reduceActionForExpression1: nodes
	^ RBAssignmentNode variable: (nodes at: 1) value: (nodes at: 3)