generated-reduction actions
reduceActionFordel_stmt1: nodes
	| result |
	result := PyDelNode new.
	result delToken: (nodes at: 1).
	result addObjects: ((nodes at: 2) at: 1) to: result trailers.
	result addNodes: ((nodes at: 2) at: 2) to: result ones.
	result addTokens: ((nodes at: 2) at: 3) to: result orTokens.
	result addNodes: ((nodes at: 2) at: 4) to: result twos.
	result addTokens: ((nodes at: 2) at: 5) to: result commaTokens.
	^ result