generated-reduction actions
reduceActionForswitch_body2: nodes
	| result |
	result := ASTSwitchBodyNode new.
	result switchBody: (nodes at: 1).
	result case: (nodes at: 2).
	^ result