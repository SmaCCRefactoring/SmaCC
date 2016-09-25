generated-reduction actions
reduceActionForinterface_property_declaration1: nodes
	| result |
	result := CSInterfacePropertyDeclarationNode new.
	result addNodes: (nodes at: 1) to: result _attributes.
	result modifier: (nodes at: 2).
	result type: (nodes at: 3).
	result name: (nodes at: 4).
	result leftBrace: (nodes at: 5).
	result getAccessor: ((nodes at: 6) at: 1).
	result setAccessor: ((nodes at: 6) at: 2).
	result rightBrace: (nodes at: 7).
	^ result