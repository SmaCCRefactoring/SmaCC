generated
reduceActionForattribute_section2: nodes
	| result |
	result := CSAttributeNode new.
	result leftBracket: (nodes at: 1).
	result target: ((nodes at: 2) at: 1).
	result colon: ((nodes at: 2) at: 2).
	result addNodes: ((nodes at: 3) at: 1) to: result attributeValues.
	result addTokens: ((nodes at: 3) at: 2) to: result commas.
	result addToken: (nodes at: 4) to: result commas.
	result rightBracket: (nodes at: 5).
	^result