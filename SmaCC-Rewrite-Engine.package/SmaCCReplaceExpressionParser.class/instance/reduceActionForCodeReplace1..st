generated
reduceActionForCodeReplace1: nodes
	| result |
	result := SmaCCCodeReplaceExpression new.
	result addVariablesFrom: (nodes at: 1).
	result code: (nodes at: 3).
	result addVariablesFrom: (nodes at: 4).
	^result