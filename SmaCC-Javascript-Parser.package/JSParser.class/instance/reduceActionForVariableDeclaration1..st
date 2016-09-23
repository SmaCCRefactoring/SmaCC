generated-reduction actions
reduceActionForVariableDeclaration1: nodes
	| result |
	result := JSVariableDeclarationNode new.
	result variable: (nodes at: 1).
	result equalsToken: ((nodes at: 2) at: 1).
	result value: ((nodes at: 2) at: 2).
	^ result