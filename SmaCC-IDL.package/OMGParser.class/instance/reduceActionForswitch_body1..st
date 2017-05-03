generated-reduction actions
reduceActionForswitch_body1: nodes
	| result |
	result := ASTSwitchBodyNode new.
	result case: (nodes at: 1).
	^ result