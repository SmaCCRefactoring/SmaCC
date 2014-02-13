generated-reduction actions
reduceActionForlocal_variable_declarator1: nodes
	| result |
	result := CSLocalVariableDeclaratorNode new.
	result _name: (nodes at: 1).
	^ result