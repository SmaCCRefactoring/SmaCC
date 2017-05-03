generated-reduction actions
reduceActionForEnumName1: nodes
	| result |
	result := DelphiEnumNameNode new.
	result name: (nodes at: 1).
	^ result