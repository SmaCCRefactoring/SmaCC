generated-reduction actions
reduceActionForconst_declarator1: nodes
	| result |
	result := CSConstDeclaratorNode new.
	result _name: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result expression: (nodes at: 3).
	^ result