generated
reduceActionForunary_expression_not_plus_minus2: nodes
	| result |
	result := JavaUnaryBitInvertNode new.
	result tilde: (nodes at: 1).
	result expression: (nodes at: 2).
	^result