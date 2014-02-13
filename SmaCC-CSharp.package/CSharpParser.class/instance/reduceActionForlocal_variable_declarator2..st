generated-reduction actions
reduceActionForlocal_variable_declarator2: nodes
	| result |
	result := CSLocalVariableDeclaratorNode new.
	result _name: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result