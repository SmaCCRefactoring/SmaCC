generated-reduction actions
reduceActionForliteral3: nodes
	| result |
	result := JavaBooleanLiteralNode new.
	result token: (nodes at: 1).
	^ result