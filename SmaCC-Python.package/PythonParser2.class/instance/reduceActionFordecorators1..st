generated-reduction actions
reduceActionFordecorators1: nodes
	| result |
	result := nodes at: 1.
	result addNode: (nodes at: 2) to: result decorators.
	^ result