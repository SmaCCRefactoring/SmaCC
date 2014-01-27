generated
reduceActionFordestructor_declaration1: nodes
	| result |
	result := CSDestructorDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result _attributes.
	result addToken: ((nodes at: 2) at: 1) to: result modifiers.
	result addToken: ((nodes at: 3) at: 1) to: result modifiers.
	result tildeToken: (nodes at: 4).
	result identifierToken: (nodes at: 5).
	result leftParenToken: (nodes at: 6).
	result rightParenToken: (nodes at: 7).
	result body: (nodes at: 8).
	^result