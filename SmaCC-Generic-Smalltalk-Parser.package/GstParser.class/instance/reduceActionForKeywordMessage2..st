generated-reduction actions
reduceActionForKeywordMessage2: nodes
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result selectorParts.
	result addNode: (nodes at: 3) to: result values.
	^ result