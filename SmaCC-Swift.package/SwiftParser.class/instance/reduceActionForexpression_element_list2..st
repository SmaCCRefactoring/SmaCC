generated-reduction actions
reduceActionForexpression_element_list2: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: (result at: 4).
	^ result