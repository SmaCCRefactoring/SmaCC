generated-reduction actions
reduceActionForcase_labels2: nodes
	| result |
	result := ASTCaseLabelsNode new.
	result caseLabels: (nodes at: 1).
	result caseLabel: (nodes at: 2).
	^ result