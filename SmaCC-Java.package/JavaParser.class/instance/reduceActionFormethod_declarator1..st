generated-reduction actions
reduceActionFormethod_declarator1: nodes
	| result |
	result := JavaMethodDeclaratorNode new.
	result _name: (nodes at: 1).
	result left: (nodes at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result parameters.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result right: (nodes at: 4).
	^ result