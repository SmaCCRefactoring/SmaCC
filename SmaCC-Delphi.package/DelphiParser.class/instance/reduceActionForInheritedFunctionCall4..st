generated-reduction actions
reduceActionForInheritedFunctionCall4: nodes
	| result |
	result := DelphiInheritedFunctionCallNode new.
	result inheritedToken: (nodes at: 1).
	^ result