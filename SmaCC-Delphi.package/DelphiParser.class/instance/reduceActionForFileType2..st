generated-reduction actions
reduceActionForFileType2: nodes
	| result |
	result := DelphiFileTypeNode new.
	result fileToken: (nodes at: 1).
	^ result