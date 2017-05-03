generated-reduction actions
reduceActionForCaseOptionList1: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 2).
	^ result