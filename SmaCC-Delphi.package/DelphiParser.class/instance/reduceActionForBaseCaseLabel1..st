generated-reduction actions
reduceActionForBaseCaseLabel1: nodes
	| result |
	result := DelphiCaseLabelNode new.
	result value: (nodes at: 1).
	^ result