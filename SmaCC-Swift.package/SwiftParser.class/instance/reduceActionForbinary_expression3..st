generated-reduction actions
reduceActionForbinary_expression3: nodes
	| result |
	result := SwiftCondionalOperatorNode new.
	result addToken: ((nodes at: 1) at: 1) to: result questionMarkTokens.
	result trueExpression: ((nodes at: 1) at: 2).
	result addToken: ((nodes at: 1) at: 3) to: result colonTokens.
	^ result