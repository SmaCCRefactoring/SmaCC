generated
reduceActionFormethod_body2: nodes
	| result |
	result := CSMethodBodyNode new.
	result semicolonToken: (nodes at: 1).
	^result