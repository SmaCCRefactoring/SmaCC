generated-reduction actions
reduceActionForLine1: nodes
	| result |
	result := CSVLineNode new.
	result addToken: (nodes at: 1) to: result values.
	^ result