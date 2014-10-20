generated-reduction actions
reduceActionForCodeReplace1: nodes
	| result |
	result := SmaCCCodeReplaceExpression new.
	result code: (nodes at: 3).
	^ result