generated-reduction actions
reduceActionForswitch_type_spec4: nodes
	| result |
	result := ASTSwitchTypeSpecNode new.
	result enumType: (nodes at: 1).
	^ result