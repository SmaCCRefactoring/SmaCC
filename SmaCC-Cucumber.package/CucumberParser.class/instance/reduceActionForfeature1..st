generated-reduction actions
reduceActionForfeature1: nodes
	| result |
	result := CucFeatureNode new.
	result addVariablesFrom: (nodes at: 1).
	result addTokens: ((nodes at: 3) at: 1) to: result tags.
	result background: (nodes at: 5).
	result addNodes: ((nodes at: 6) at: 1) to: result feature_elements.
	result addVariablesFrom: (nodes at: 7).
	^ result