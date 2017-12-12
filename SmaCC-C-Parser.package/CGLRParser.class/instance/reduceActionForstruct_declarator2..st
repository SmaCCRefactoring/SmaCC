generated-reduction actions
reduceActionForstruct_declarator2: nodes
	| result |
	result := CGLRStructDeclaratorNode new.
	result colonToken: (nodes at: 1).
	result _size: (nodes at: 2).
	^ result