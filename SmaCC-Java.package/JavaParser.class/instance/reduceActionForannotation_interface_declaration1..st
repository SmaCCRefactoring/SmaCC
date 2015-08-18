generated-reduction actions
reduceActionForannotation_interface_declaration1: nodes
	| result |
	result := JavaAnnotationInterfaceNode new.
	result addNodes: (nodes at: 1) to: result modifiers.
	result atToken: (nodes at: 2).
	result interfaceToken: (nodes at: 3).
	result _name: (nodes at: 4).
	result left: ((nodes at: 5) at: 1).
	result addNodes: ((nodes at: 5) at: 2) to: result declarations.
	result right: ((nodes at: 5) at: 3).
	^ result