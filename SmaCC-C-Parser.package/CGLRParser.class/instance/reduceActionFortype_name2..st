generated-reduction actions
reduceActionFortype_name2: nodes
	| result |
	result := CGLRTypeNameNode new.
	result addObjects: ((nodes at: 1) at: 1) to: result specifiers.
	result addTokens: ((nodes at: 1) at: 2) to: result qualifiers.
	result abstract: (nodes at: 2).
	^ result