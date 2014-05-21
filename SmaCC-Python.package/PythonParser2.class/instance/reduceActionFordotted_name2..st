generated-reduction actions
reduceActionFordotted_name2: nodes
	| result |
	result := ASTDottedNameNode new.
	result addToken: (nodes at: 1) to: result names.
	^ result