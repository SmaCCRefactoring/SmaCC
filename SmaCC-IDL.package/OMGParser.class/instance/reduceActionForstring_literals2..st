generated-reduction actions
reduceActionForstring_literals2: nodes
	| result |
	result := ASTStringLiteralsNode new.
	result stringLiterals: (nodes at: 1).
	result commaToken: (nodes at: 2).
	result sTRING_LITERALToken: (nodes at: 3).
	^ result