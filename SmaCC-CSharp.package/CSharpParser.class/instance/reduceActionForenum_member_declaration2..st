generated-reduction actions
reduceActionForenum_member_declaration2: nodes
	| result |
	result := CSEnumDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result _name: (nodes at: 2).
	result equal: (nodes at: 3).
	result _value: (nodes at: 4).
	^ result