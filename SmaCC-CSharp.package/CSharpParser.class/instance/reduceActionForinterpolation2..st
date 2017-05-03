generated-reduction actions
reduceActionForinterpolation2: nodes
	| result |
	result := CSInterpolationNode new.
	result expression: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result constant: (nodes at: 3).
	^ result