generated-reduction actions
reduceActionFormethod_body2: nodes
	| result |
	result := CSMethodBodyNode new.
	result equalGreaterThanToken: (nodes at: 1).
	result expression: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result