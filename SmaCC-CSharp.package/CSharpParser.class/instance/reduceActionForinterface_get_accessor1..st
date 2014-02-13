generated-reduction actions
reduceActionForinterface_get_accessor1: nodes
	| result |
	result := CSInterfacePropertyAccessorNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result _attributes.
	result accessorType: (nodes at: 2).
	result semicolon: (nodes at: 3).
	^ result