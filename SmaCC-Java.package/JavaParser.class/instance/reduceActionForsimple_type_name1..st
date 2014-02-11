generated-reduction actions
reduceActionForsimple_type_name1: nodes
	| result |
	result := JavaTypeNameNode new.
	result _name: (nodes at: 1).
	result left: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result arguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result right: ((nodes at: 2) at: 4).
	^ result