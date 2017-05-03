generated-reduction actions
reduceActionForparam_attribute2: nodes
	| result |
	result := ASTParamAttributeNode new.
	result outToken: (nodes at: 1).
	^ result