generated-reduction actions
reduceActionForcompilation_unit1: nodes
	| result |
	result := CSCompilationUnitNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result directives.
	result addNodes: ((nodes at: 2) at: 1) to: result directives.
	result addNodes: ((nodes at: 3) at: 1) to: result _attributes.
	result addNodes: ((nodes at: 4) at: 1) to: result declarations.
	^ result