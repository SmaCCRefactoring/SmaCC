generated-reduction actions
reduceActionForswitch_type_spec3: nodes
	| result |
	result := ASTSwitchTypeSpecNode new.
	result booleanType: (nodes at: 1).
	^ result