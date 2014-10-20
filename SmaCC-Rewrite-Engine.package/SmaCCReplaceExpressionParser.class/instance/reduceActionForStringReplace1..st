generated-reduction actions
reduceActionForStringReplace1: nodes
	| result |
	result := SmaCCStringReplaceExpression new.
	result string: (nodes at: 1).
	^ result