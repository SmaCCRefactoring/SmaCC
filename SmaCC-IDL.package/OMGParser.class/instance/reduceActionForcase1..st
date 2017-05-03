generated-reduction actions
reduceActionForcase1: nodes
	| result |
	result := ASTCaseNode new.
	result caseLabels: (nodes at: 1).
	result elementSpec: (nodes at: 2).
	result semicolonToken: (nodes at: 3).
	^ result