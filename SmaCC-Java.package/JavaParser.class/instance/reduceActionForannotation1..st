generated-reduction actions
reduceActionForannotation1: nodes
	| result |
	result := JavaAnnotationNode new.
	result _at: (nodes at: 1).
	result _name: (nodes at: 2).
	result left: ((nodes at: 3) at: 1).
	result addNodes: ((nodes at: 3) at: 2) to: result values.
	result addTokens: ((nodes at: 3) at: 3) to: result commas.
	result right: ((nodes at: 3) at: 4).
	^ result