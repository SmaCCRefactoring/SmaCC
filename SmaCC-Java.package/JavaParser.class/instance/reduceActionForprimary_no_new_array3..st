generated-reduction actions
reduceActionForprimary_no_new_array3: nodes
	| result |
	result := nodes at: 2.
	result addFirstToken: (nodes at: 1) to: result lefts.
	result addToken: (nodes at: 3) to: result rights.
	^ result