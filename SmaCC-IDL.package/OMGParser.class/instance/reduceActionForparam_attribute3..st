generated-reduction actions
reduceActionForparam_attribute3: nodes
	| result |
	result := ASTParamAttributeNode new.
	result inoutToken: (nodes at: 1).
	^ result