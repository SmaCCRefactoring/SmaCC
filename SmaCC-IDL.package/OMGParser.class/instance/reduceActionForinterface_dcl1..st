generated-reduction actions
reduceActionForinterface_dcl1: nodes
	| result |
	result := ASTInterfaceDclNode new.
	result interfaceHeader: (nodes at: 1).
	result leftBraceToken: (nodes at: 2).
	result interfaceBody: (nodes at: 3).
	result rightBraceToken: (nodes at: 4).
	^ result