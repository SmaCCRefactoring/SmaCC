generated-reduction actions
reduceActionForswitch_type_spec2: nodes
	| result |
	result := ASTSwitchTypeSpecNode new.
	result charType: (nodes at: 1).
	^ result