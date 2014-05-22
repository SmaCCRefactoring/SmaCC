generated-reduction actions
reduceActionForelse_opt2: nodes
	| result |
	result := PyElseNode new.
	result elseToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result else: (nodes at: 3).
	^ result