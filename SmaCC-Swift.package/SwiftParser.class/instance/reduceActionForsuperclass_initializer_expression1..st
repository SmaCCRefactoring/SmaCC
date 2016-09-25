generated-reduction actions
reduceActionForsuperclass_initializer_expression1: nodes
	| result |
	result := SwiftSuperclassInitializerExpressionNode new.
	result superToken: (nodes at: 1).
	result periodToken: (nodes at: 2).
	result initToken: (nodes at: 3).
	^ result