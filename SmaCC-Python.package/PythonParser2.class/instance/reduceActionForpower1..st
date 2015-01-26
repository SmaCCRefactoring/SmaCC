generated-reduction actions
reduceActionForpower1: nodes
	| result |
	result := PyPowerNode new.
	result atom: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result trailers.
	^ result