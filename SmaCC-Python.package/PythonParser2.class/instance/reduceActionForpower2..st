generated-reduction actions
reduceActionForpower2: nodes
	| result |
	result := PyPowerNode new.
	result atom: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result trailers.
	result timesTimesToken: (nodes at: 3).
	result factor: (nodes at: 4).
	^ result