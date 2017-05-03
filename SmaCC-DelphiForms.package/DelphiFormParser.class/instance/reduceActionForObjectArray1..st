generated-reduction actions
reduceActionForObjectArray1: nodes
	| result |
	result := DelphiFormObjectArrayNode new.
	result left: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result items.
	result right: (nodes at: 3).
	^ result