generated
reduceActionForswitch_section1: nodes
	| result |
	result := CSSwitchSectionNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result labels.
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	^result