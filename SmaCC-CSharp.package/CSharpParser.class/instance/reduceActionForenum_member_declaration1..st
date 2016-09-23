generated-reduction actions
reduceActionForenum_member_declaration1: nodes
	| result |
	result := CSEnumDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result name: (nodes at: 2).
	^ result