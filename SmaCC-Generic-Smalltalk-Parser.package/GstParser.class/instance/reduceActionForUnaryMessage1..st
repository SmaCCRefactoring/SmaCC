generated-reduction actions
reduceActionForUnaryMessage1: nodes
	| result |
	result := GstUnaryMessageNode new.
	result selectorPart: (nodes at: 1).
	^ result