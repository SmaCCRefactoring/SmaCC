generated-reduction actions
reduceActionForprimary_expression3: nodes
	| result |
	result := CGLRStringLiteralNode new.
	result sTRING_LITERALToken: (nodes at: 1).
	^ result