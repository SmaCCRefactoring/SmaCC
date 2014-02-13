generated-reduction actions
reduceActionFormethod_body1: nodes
	| result |
	result := CSMethodBodyNode new.
	result block: (nodes at: 1).
	^ result