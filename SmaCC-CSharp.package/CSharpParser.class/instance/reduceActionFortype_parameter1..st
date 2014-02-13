generated-reduction actions
reduceActionFortype_parameter1: nodes
	| result |
	result := CSTypeNameNode new.
	result _name: (nodes at: 1).
	^ result