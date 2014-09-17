generated-reduction actions
reduceActionForDefinition3: nodes
	| result |
	result := LLVMAsmModuleNode new.
	result moduleToken: (nodes at: 1).
	result asmToken: (nodes at: 2).
	result asm: (nodes at: 3).
	^ result