generated-reduction actions
reduceActionForFile1: nodes
	| result |
	result := FileNode new.
	result addTokens: (nodes at: 1) to: result lines.
	^ result