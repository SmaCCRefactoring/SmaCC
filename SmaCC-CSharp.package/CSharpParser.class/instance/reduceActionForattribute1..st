generated
reduceActionForattribute1: nodes
	| result |
	result := CSAttributeValueNode new.
	result name: (nodes at: 1).
	result leftParen: ((nodes at: 2) at: 1).
	result rightParen: ((nodes at: 2) at: 2).
	result addNodes: ((nodes at: 2) at: 3) to: result arguments.
	result addTokens: ((nodes at: 2) at: 4) to: result commas.
	^result