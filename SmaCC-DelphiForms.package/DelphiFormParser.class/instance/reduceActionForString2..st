generated-reduction actions
reduceActionForString2: nodes
	| result |
	result := DelphiFormCombinedStringNode new.
	result left: (nodes at: 1).
	result plus: (nodes at: 2).
	result right: (nodes at: 3).
	^ result