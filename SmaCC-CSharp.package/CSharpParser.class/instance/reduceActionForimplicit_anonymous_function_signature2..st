generated
reduceActionForimplicit_anonymous_function_signature2: nodes
	| result |
	result := CSImplicitAnonymousFunctionSignatureNode new.
	result addToken: (nodes at: 1) to: result names.
	^result