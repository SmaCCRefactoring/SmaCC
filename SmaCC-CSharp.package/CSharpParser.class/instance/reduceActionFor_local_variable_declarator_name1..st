generated-reduction actions
reduceActionFor_local_variable_declarator_name1: nodes
	| result |
	result := CSSimpleNameNode new.
	result identifierToken: (nodes at: 1).
	^ result