generated-reduction actions
reduceActionForAsmBlock1: nodes
	| result |
	result := DelphiAsmBlockNode new.
	result asmToken: (nodes at: 2).
	result endToken: (nodes at: 3).
	^ result