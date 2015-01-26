generated-reduction actions
reduceActionFordecorated2: nodes
	| result |
	result := PyDecoratedNode new.
	result decorators: (nodes at: 1).
	result funcdef: (nodes at: 2).
	^ result