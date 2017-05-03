generated-reduction actions
reduceActionFormodule1: nodes
	| result |
	result := ASTModuleNode new.
	result moduleToken: (nodes at: 1).
	result id: (nodes at: 2).
	result leftBraceToken: (nodes at: 3).
	result definitions: (nodes at: 4).
	result rightBraceToken: (nodes at: 5).
	^ result