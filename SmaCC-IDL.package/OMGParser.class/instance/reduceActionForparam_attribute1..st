generated-reduction actions
reduceActionForparam_attribute1: nodes
	| result |
	result := ASTParamAttributeNode new.
	result inToken: (nodes at: 1).
	^ result