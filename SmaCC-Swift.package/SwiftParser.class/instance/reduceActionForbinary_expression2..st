generated-reduction actions
reduceActionForbinary_expression2: nodes
	| result |
	result := SwiftAssignmentOperatorNode new.
	result addToken: (nodes at: 1) to: result equalTokens.
	^ result