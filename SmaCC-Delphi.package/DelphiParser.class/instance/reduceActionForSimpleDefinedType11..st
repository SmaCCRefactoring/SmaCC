generated-reduction actions
reduceActionForSimpleDefinedType11: nodes
	| result |
	result := DelphiTypeTypeNode new.
	result typeToken: (nodes at: 1).
	result typeName: (nodes at: 2).
	^ result