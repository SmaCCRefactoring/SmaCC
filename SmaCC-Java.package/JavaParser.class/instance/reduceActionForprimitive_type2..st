generated-reduction actions
reduceActionForprimitive_type2: nodes
	| result |
	result := JavaBooleanTypeNode new.
	result token: (nodes at: 1).
	^ result