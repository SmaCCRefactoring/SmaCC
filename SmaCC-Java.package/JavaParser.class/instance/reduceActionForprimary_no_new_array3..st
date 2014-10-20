generated-reduction actions
reduceActionForprimary_no_new_array3: nodes
	| result |
	result := nodes at: 2.
	result left: (nodes at: 1).
	result right: (nodes at: 3).
	^ result