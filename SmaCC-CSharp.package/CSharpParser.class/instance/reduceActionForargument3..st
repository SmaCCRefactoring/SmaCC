generated
reduceActionForargument3: nodes
	| result |
	result := CSArgumentNode new.
	result outToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^result