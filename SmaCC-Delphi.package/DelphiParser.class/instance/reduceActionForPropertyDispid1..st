generated-reduction actions
reduceActionForPropertyDispid1: nodes
	| result |
	result := DelphiPropertyDispidNode new.
	result dispidToken: (nodes at: 1).
	result expression: (nodes at: 2).
	^ result