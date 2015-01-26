generated-reduction actions
reduceActionFordictorsetmaker3: nodes
	| result |
	result := PyDictorsetmakerNode new.
	result test: (nodes at: 1).
	result comp: (nodes at: 2).
	^ result