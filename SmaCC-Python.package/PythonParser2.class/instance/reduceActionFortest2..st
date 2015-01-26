generated-reduction actions
reduceActionFortest2: nodes
	| result |
	result := PyIfTestNode new.
	result or: (nodes at: 1).
	result ifToken: (nodes at: 2).
	result if: (nodes at: 3).
	result elseToken: (nodes at: 4).
	result else: (nodes at: 5).
	^ result