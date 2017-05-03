generated-reduction actions
reduceActionForByteArray1: nodes
	| result |
	result := DelphiFormByteArrayNode new.
	result left: (nodes at: 1).
	result addTokens: (nodes at: 2) to: result lines.
	result right: (nodes at: 3).
	^ result