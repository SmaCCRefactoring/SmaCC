generated
reduceActionForargument2: nodes
	| result |
	result := CSArgumentNode new.
	result refToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^result