generated-reduction actions
reduceActionFormethod_body2: nodes
	| result |
	result := JavaEmptyMethodBodyNode new.
	result semicolon: (nodes at: 1).
	^ result