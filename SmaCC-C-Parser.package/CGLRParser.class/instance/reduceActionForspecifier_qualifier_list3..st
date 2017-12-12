generated-reduction actions
reduceActionForspecifier_qualifier_list3: nodes
	| result |
	result := nodes at: 2.
	self addFirst: (nodes at: 1) to: (result at: 2).
	^ result