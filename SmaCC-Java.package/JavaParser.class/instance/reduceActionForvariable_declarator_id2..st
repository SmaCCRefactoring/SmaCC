generated-reduction actions
reduceActionForvariable_declarator_id2: nodes
	| result |
	result := JavaArrayVariableNameNode new.
	result variable: (nodes at: 1).
	result left: (nodes at: 2).
	result right: (nodes at: 3).
	^ result