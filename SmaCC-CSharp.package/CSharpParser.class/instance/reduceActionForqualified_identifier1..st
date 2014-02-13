generated-reduction actions
reduceActionForqualified_identifier1: nodes
	| result |
	result := CSQualifiedIdentifierNode new.
	result addToken: (nodes at: 1) to: result names.
	^ result