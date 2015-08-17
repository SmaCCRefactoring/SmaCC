generated-reduction actions
reduceActionForLine1: nodes
	| result |
	result := CSVLineNode new.
	result addObject: (nodes at: 1) to: result values.
	^ result