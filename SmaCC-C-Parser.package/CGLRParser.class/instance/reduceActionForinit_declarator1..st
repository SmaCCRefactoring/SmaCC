generated-reduction actions
reduceActionForinit_declarator1: nodes
	| result |
	result := CGLRInitDeclaratorNode new.
	result declarator: (nodes at: 1).
	^ result