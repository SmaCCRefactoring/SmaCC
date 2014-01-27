generated
reduceActionForevent_declaration2: nodes
	| result |
	result := CSEventDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result _attributes.
	result addTokens: ((nodes at: 2) at: 1) to: result modifiers.
	result eventToken: (nodes at: 3).
	result type: (nodes at: 4).
	result name: ((nodes at: 5) at: 1).
	result interface: ((nodes at: 5) at: 2).
	result periodToken: ((nodes at: 5) at: 3).
	result leftBraceToken: (nodes at: 6).
	result addDeclaration: ((nodes at: 7) at: 1).
	result removeDeclaration: ((nodes at: 7) at: 2).
	result rightBraceToken: (nodes at: 8).
	^result