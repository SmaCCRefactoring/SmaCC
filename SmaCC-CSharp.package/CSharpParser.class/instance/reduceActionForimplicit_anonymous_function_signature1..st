generated
reduceActionForimplicit_anonymous_function_signature1: nodes
	| result |
	result := CSImplicitAnonymousFunctionSignatureNode new.
	result leftParenToken: (nodes at: 1).
	result addTokens: ((nodes at: 2) at: 1) to: result names.
	result addTokens: ((nodes at: 2) at: 2) to: result commaTokens.
	result rightParenToken: (nodes at: 3).
	^result