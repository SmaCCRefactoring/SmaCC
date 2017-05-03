generated-reduction actions
reduceActionForconst_dcl1: nodes
	| result |
	result := ASTConstDclNode new.
	result constToken: (nodes at: 1).
	result constType: (nodes at: 2).
	result id: (nodes at: 3).
	result equalToken: (nodes at: 4).
	result constExp: (nodes at: 5).
	^ result