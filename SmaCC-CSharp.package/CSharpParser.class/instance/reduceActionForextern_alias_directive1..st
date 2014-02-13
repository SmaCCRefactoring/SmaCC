generated-reduction actions
reduceActionForextern_alias_directive1: nodes
	| result |
	result := CSExternAliasDirectiveNode new.
	result externToken: (nodes at: 1).
	result aliasToken: (nodes at: 2).
	result identifierToken: (nodes at: 3).
	result semicolonToken: (nodes at: 4).
	^ result