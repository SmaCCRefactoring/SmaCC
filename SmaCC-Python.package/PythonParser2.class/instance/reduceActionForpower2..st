generated-reduction actions
reduceActionForpower2: nodes
	| result |
	result := ASTPowerNode new.
	result atom: (nodes at: 1).
	result addObjects: ((nodes at: 2) at: 1) to: result trailers.
	result timesTimesToken: (nodes at: 3).
	result factor: (nodes at: 4).
	^ result