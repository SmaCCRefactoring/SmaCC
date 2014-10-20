generated-reduction actions
reduceActionForabstract_method_declaration1: nodes
	| result |
	result := JavaAbstractMethodDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result modifiers.
	result typeParameters: ((nodes at: 1) at: 2).
	result type: ((nodes at: 1) at: 3).
	result declarator: ((nodes at: 1) at: 4).
	result throws: ((nodes at: 1) at: 5).
	result semicolon: (nodes at: 2).
	^ result