generated-reduction actions
reduceActionForswitch_type_spec1: nodes
	| result |
	result := ASTSwitchTypeSpecNode new.
	result integerType: (nodes at: 1).
	^ result