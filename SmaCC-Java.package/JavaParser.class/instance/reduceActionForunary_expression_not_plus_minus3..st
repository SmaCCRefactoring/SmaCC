generated
reduceActionForunary_expression_not_plus_minus3: nodes
	| result |
	result := JavaUnaryNotNode new.
	result bang: (nodes at: 1).
	result expression: (nodes at: 2).
	^result