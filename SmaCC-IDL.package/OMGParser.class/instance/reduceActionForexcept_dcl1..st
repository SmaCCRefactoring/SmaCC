generated-reduction actions
reduceActionForexcept_dcl1: nodes
	| result |
	result := ASTExceptDclNode new.
	result exceptionToken: (nodes at: 1).
	result id: (nodes at: 2).
	result leftBraceToken: (nodes at: 3).
	result memberList: (nodes at: 4).
	result rightBraceToken: (nodes at: 5).
	^ result