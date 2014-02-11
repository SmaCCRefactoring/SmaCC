generated-reduction actions
reduceActionForswitch_block4: nodes
	| result |
	result := JavaSwitchBlockNode new.
	result left: (nodes at: 1).
	result right: (nodes at: 2).
	^ result