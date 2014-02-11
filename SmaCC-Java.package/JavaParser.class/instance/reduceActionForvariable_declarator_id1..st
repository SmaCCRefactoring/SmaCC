generated-reduction actions
reduceActionForvariable_declarator_id1: nodes
	| result |
	result := JavaVariableNameNode new.
	result _name: (nodes at: 1).
	^ result