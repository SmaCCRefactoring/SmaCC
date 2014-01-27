generated
reduceActionForExpression7: nodes
	| result |
	result := SmaCCRewriteTestNumberNode new.
	result number: (nodes at: 1).
	^result