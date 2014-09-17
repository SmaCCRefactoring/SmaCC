generated-reduction actions
reduceActionForDefinition9: nodes
	| result |
	result := LLVMGlobalAliasAssignNode new.
	result assign: (nodes at: 1).
	result visibility: (nodes at: 2).
	result aliasToken: (nodes at: 3).
	result alias: (nodes at: 4).
	result aliasee: (nodes at: 5).
	^ result