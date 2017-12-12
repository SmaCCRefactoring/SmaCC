generated-reduction actions
reduceActionForabstract_declarator3: nodes
	| result |
	result := CGLRAbstractDeclaratorNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result pointers.
	result addTokens: ((nodes at: 1) at: 2) to: result qualifiers.
	result direct: (nodes at: 2).
	^ result