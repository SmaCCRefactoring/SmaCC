generated-reduction actions
reduceActionForold_lambdef1: nodes
	| result |
	result := ASTLambdaNode new.
	result lambdaToken: (nodes at: 1).
	result args: (nodes at: 2).
	result colonToken: (nodes at: 3).
	result body: (nodes at: 4).
	^ result