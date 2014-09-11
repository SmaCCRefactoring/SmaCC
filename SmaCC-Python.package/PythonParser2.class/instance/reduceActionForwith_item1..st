generated-reduction actions
reduceActionForwith_item1: nodes
	| result |
	result := PyWithItemNode new.
	result test: (nodes at: 1).
	^ result