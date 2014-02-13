generated-reduction actions
reduceActionForremove_accessor_declaration1: nodes
	| result |
	result := CSRemoveAccessorDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result _attributes.
	result removeToken: (nodes at: 2).
	result block: (nodes at: 3).
	^ result