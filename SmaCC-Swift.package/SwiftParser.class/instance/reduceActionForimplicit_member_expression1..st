generated-reduction actions
reduceActionForimplicit_member_expression1: nodes
	| result |
	result := SwiftImplicitMemberExpressionNode new.
	result periodToken: (nodes at: 1).
	result identifierToken: (nodes at: 2).
	^ result