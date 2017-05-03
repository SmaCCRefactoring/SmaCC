generated-reduction actions
reduceActionForInterfaceType2: nodes
	| result |
	result := DelphiInterfaceTypeNode new.
	result interfaceToken: (nodes at: 1).
	^ result