generated-reduction actions
reduceActionForstruct_declarator3: nodes
	| result |
	result := CGLRStructDeclaratorNode new.
	result declarator: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result _size: (nodes at: 3).
	^ result