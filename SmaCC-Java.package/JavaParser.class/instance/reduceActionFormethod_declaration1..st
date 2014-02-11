generated-reduction actions
reduceActionFormethod_declaration1: nodes
	| result |
	result := JavaMethodDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result modifiers.
	result type: ((nodes at: 1) at: 2).
	result declarator: ((nodes at: 1) at: 3).
	result throws: ((nodes at: 1) at: 4).
	result body: (nodes at: 2).
	^ result