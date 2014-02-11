generated-reduction actions
reduceActionForenum_constant1: nodes
	| result |
	result := JavaEnumConstantNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result annotations.
	result _name: (nodes at: 2).
	result leftParen: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result expressions.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result rightParen: ((nodes at: 3) at: 4).
	result left: ((nodes at: 4) at: 1).
	result addNodes: ((nodes at: 4) at: 2) to: result declarations.
	result right: ((nodes at: 4) at: 3).
	^ result