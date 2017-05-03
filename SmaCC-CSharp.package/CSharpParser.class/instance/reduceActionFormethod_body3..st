generated-reduction actions
reduceActionFormethod_body3: nodes
	| result |
	result := CSMethodBodyNode new.
	result semicolonToken: (nodes at: 1).
	^ result