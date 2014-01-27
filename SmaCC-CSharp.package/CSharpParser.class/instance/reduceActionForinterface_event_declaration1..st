generated
reduceActionForinterface_event_declaration1: nodes
	| result |
	result := CSInterfaceEventDeclarationNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result eventToken: (nodes at: 3).
	result type: (nodes at: 4).
	result name: (nodes at: 5).
	result semicolon: (nodes at: 6).
	^result