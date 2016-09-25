generated-reduction actions
reduceActionForstatement2: nodes
	| result |
	result := SwiftDeclarationStatementNode new.
	result declaration: (nodes at: 1).
	result semicolonToken: (nodes at: 2).
	^ result