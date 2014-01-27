generated
reduceActionForlocal_variable_type2: nodes
	| result |
	result := CSVarTypeNode new.
	result varToken: (nodes at: 1).
	^result