generated-reduction actions
reduceActionForforward_dcl1: nodes
	| result |
	result := ASTForwardDclNode new.
	result interfaceToken: (nodes at: 1).
	result id: (nodes at: 2).
	^ result