generated-reduction actions
reduceActionFortypename1: nodes
	| result |
	result := CGLRTypenameNode new.
	result symbol: (nodes at: 1).
	^ result