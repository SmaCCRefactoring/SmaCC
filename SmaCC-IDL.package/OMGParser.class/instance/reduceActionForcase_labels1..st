generated-reduction actions
reduceActionForcase_labels1: nodes
	| result |
	result := ASTCaseLabelsNode new.
	result caseLabel: (nodes at: 1).
	^ result