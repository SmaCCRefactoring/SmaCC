generated-reduction actions
reduceActionFormodifier11: nodes
	| result |
	result := JavaModifierNode new.
	result token: (nodes at: 1).
	^ result