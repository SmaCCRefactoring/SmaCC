generated-reduction actions
reduceActionFordictorsetmaker1: nodes
	| result |
	result := PyDictorsetmakerNode new.
	result test: (nodes at: 1).
	result colonToken: (nodes at: 2).
	result test2: (nodes at: 3).
	result comp: (nodes at: 4).
	^ result