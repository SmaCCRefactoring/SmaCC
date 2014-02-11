generated-reduction actions
reduceActionForelementValueArrayInitializer1: nodes
	| result |
	result := JavaElementArrayInitializerNode new.
	result left: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result values.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result addToken: ((nodes at: 3) at: 1) to: result commas.
	result right: (nodes at: 4).
	^ result