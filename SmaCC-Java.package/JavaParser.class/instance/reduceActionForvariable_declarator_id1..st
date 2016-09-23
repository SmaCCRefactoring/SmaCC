generated-reduction actions
reduceActionForvariable_declarator_id1: nodes
	| result |
	result := JavaVariableNameNode new.
	result name: (nodes at: 1).
	^ result