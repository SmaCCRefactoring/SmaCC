generated-reduction actions
reduceActionForKeywordMessage1: nodes
	| result |
	result := GstKeywordMessageNode new.
	result addToken: (nodes at: 1) to: result selectorParts.
	result addNode: (nodes at: 2) to: result values.
	^ result