generated-reduction actions
reduceActionForswitch_type_spec5: nodes
	| result |
	result := ASTSwitchTypeSpecNode new.
	result scopedName: (nodes at: 1).
	^ result