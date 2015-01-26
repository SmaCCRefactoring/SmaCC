generated-reduction actions
reduceActionForsubscript2: nodes
	| result |
	result := PySubscriptNode new.
	result test: (nodes at: 1).
	^ result