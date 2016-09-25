generated-reduction actions
reduceActionForFile1: nodes
	| result |
	result := CSVFileNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result lines.
	result addTokens: ((nodes at: 1) at: 2) to: result eols.
	^ result