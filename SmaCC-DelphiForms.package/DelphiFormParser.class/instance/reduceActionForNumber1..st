generated-reduction actions
reduceActionForNumber1: nodes
	| result |
	result := DelphiFormIntegerNode new.
	result value: (nodes at: 1).
	^ result