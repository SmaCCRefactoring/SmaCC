generated-reduction actions
reduceActionFordecorated1: nodes
	| result |
	result := PyDecoratedNode new.
	result decorators: (nodes at: 1).
	result classdef: (nodes at: 2).
	^ result