generated
reduceActionForswitch_label2: nodes
	| result |
	result := CSSwitchLabelNode new.
	result defaultToken: (nodes at: 1).
	result colonToken: (nodes at: 2).
	^result