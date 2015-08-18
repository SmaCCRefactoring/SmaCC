generated-reduction actions
reduceActionForTryStatement1: nodes
	| result |
	result := JSTryStatementNode new.
	result tryToken: (nodes at: 1).
	result tryBlock: (nodes at: 2).
	result catchToken: ((nodes at: 3) at: 1).
	result leftParen: ((nodes at: 3) at: 2).
	result exceptionType: ((nodes at: 3) at: 3).
	result rightParen: ((nodes at: 3) at: 4).
	result catchBlock: ((nodes at: 3) at: 5).
	^ result