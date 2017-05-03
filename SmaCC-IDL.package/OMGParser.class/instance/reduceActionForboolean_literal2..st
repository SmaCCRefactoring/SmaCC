generated-reduction actions
reduceActionForboolean_literal2: nodes
	| result |
	result := ASTBooleanLiteralNode new.
	result fALSEToken: (nodes at: 1).
	^ result