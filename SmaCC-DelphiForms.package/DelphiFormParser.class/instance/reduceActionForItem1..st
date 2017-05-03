generated-reduction actions
reduceActionForItem1: nodes
	| result |
	result := DelphiFormItemNode new.
	result itemToken: (nodes at: 1).
	result addNodes: (nodes at: 2) to: result properties.
	result endToken: (nodes at: 3).
	^ result