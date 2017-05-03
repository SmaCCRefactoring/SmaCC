generated-reduction actions
reduceActionForboolean_literal1: nodes
	| result |
	result := ASTBooleanLiteralNode new.
	result tRUEToken: (nodes at: 1).
	^ result