generated-reduction actions
reduceActionForstatement_expression_list2: nodes
	| result |
	result := nodes at: 1.
	result addToken: (nodes at: 2) to: result commas.
	result addNode: (nodes at: 3) to: result expressions.
	^ result