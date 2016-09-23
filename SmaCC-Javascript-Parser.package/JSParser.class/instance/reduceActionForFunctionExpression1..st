generated-reduction actions
reduceActionForFunctionExpression1: nodes
	| result |
	result := JSFunctionNode new.
	result functionToken: (nodes at: 1).
	result name: (nodes at: 2).
	result addToken: (nodes at: 3) to: result leftParens.
	result addTokens: ((nodes at: 4) at: 1) to: result arguments.
	result addTokens: ((nodes at: 4) at: 2) to: result commas.
	result addToken: (nodes at: 5) to: result rightParens.
	result leftBrace: (nodes at: 6).
	result addNodes: (nodes at: 7) to: result statements.
	result rightBrace: (nodes at: 8).
	^ result