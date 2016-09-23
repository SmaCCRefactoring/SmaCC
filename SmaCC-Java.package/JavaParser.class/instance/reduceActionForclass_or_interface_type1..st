generated-reduction actions
reduceActionForclass_or_interface_type1: nodes
	| result |
	result := JavaClassTypeNode new.
	result name: (nodes at: 1).
	^ result