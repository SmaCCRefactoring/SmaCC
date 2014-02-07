generated
reduceActionForcompilation_unit1: nodes
	| result |
	result := JavaProgramFileNode new.
	result packageDeclaration: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result imports.
	result addNodes: ((nodes at: 3) at: 1) to: result typeDeclarations.
	^result