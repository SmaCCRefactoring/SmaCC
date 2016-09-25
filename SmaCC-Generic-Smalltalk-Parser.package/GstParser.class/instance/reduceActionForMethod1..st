generated-reduction actions
reduceActionForMethod1: nodes
	| result |
	result := GstMethodNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result selectorParts.
	result addNodes: ((nodes at: 1) at: 2) to: result variables.
	result body: (nodes at: 2).
	^ result