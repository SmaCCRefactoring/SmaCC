generated-reduction actions
reduceActionForinit_declarator2: nodes
	| result |
	result := CGLRInitDeclaratorNode new.
	result declarator: (nodes at: 1).
	result equalToken: (nodes at: 2).
	result initializer: (nodes at: 3).
	^ result