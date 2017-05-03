generated-reduction actions
reduceActionForSet1: nodes
	| result |
	result := DelphiFormSetNode new.
	result left: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result items.
	result addTokens: ((nodes at: 2) at: 2) to: result commas.
	result right: (nodes at: 3).
	^ result