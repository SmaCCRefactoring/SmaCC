generated-reduction actions
reduceActionForbinary_expression4: nodes
	| result |
	result := SwiftTypeCastOperatorNode new.
	result isToken: ((nodes at: 1) at: 1).
	result type: ((nodes at: 1) at: 2).
	result asToken: ((nodes at: 1) at: 3).
	result questionMarkToken: ((nodes at: 1) at: 4).
	^ result