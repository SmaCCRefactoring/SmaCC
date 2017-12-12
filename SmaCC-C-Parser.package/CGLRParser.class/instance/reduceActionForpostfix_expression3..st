generated-reduction actions
reduceActionForpostfix_expression3: nodes
	| result |
	result := CGLRCallNode new.
	result f: (nodes at: 1).
	result leftParenToken: (nodes at: 2).
	result rightParenToken: (nodes at: 3).
	^ result