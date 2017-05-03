generated-reduction actions
reduceActionForConstantValue1: nodes
	| result |
	result := DelphiConstantDefinitionNode new.
	result name: (nodes at: 1).
	result colon: ((nodes at: 2) at: 1).
	result type: ((nodes at: 2) at: 2).
	result equalToken: (nodes at: 3).
	result expression: (nodes at: 4).
	result modifier: (nodes at: 5).
	result deprecatedToken: (nodes at: 6).
	result semicolon: (nodes at: 7).
	^ result