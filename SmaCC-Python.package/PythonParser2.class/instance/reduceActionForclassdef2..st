generated-reduction actions
reduceActionForclassdef2: nodes
	| result |
	result := PyClassdefNode new.
	result classToken: (nodes at: 1).
	result cname: (nodes at: 2).
	result lparenToken: (nodes at: 3).
	result rparenToken: (nodes at: 5).
	result colonToken: (nodes at: 6).
	result body: (nodes at: 7).
	^ result