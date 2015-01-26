generated-reduction actions
reduceActionFordecorators2: nodes
	| result |
	result := PyDecoratorsNode new.
	result addNode: (nodes at: 1) to: result decorators.
	^ result