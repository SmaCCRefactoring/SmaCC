generated-reduction actions
reduceActionForstring_literals1: nodes
	| result |
	result := ASTStringLiteralsNode new.
	result sTRING_LITERALToken: (nodes at: 1).
	^ result