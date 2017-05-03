generated-reduction actions
reduceActionForQualifiedName1: nodes
	| result |
	result := DelphiFormQualifiedNameNode new.
	result addToken: (nodes at: 1) to: result names.
	^ result