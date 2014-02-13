generated-reduction actions
reduceActionFornamespace_or_type_name2: nodes
	| result |
	result := CSTypeNameNode new.
	result namespace: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result _name: (nodes at: 3).
	result typeArguments: (nodes at: 4).
	^ result