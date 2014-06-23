generated-reduction actions
reduceActionForfeature1: nodes
	| result |
	result := CucFeatureNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result tags.
	result background: (nodes at: 4).
	result addNodes: ((nodes at: 5) at: 1) to: result feature_elements.
	^ result