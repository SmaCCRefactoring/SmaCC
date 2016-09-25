generated-reduction actions
reduceActionForextern_alias_directives2: nodes
	| result |
	result := nodes at: 1.
	self add: (nodes at: 2) to: result.
	^ result