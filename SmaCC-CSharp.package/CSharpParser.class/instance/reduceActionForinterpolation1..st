generated-reduction actions
reduceActionForinterpolation1: nodes
	| result |
	result := CSInterpolationNode new.
	result expression: (nodes at: 1).
	^ result