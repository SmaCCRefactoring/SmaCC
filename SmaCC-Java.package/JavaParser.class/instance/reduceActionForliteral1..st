generated-reduction actions
reduceActionForliteral1: nodes
	| result |
	result := JavaIntegerLiteralNode new.
	result token: (nodes at: 1).
	^ result