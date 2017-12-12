generated-reduction actions
reduceActionForabstract_declarator2: nodes
	| result |
	result := CGLRAbstractDeclaratorNode new.
	result direct: (nodes at: 1).
	^ result