generated-reduction actions
reduceActionForattribute1: nodes
	| result |
	result := CSAttributeValueNode new.
	result _name: (nodes at: 1).
	result leftParen: ((nodes at: 2) at: 1).
	result addNodes: ((nodes at: 2) at: 2) to: result arguments.
	result addTokens: ((nodes at: 2) at: 3) to: result commas.
	result rightParen: ((nodes at: 2) at: 4).
	^ result