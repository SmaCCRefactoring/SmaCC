generated-reduction actions
reduceActionForSimpleDefinedType1: nodes
	| result |
	result := DelphiNamedTypeNode new.
	result typeExpression: (nodes at: 1).
	^ result