generated-reduction actions
reduceActionForstatement3: nodes
	| result |
	result := nodes at: 1.
	result semicolonToken: (nodes at: 2).
	^ result