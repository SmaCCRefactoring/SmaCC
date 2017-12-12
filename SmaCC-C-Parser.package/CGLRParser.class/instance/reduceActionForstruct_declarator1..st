generated-reduction actions
reduceActionForstruct_declarator1: nodes
	| result |
	result := CGLRStructDeclaratorNode new.
	result declarator: (nodes at: 1).
	^ result