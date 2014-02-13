generated-reduction actions
reduceActionForchecked_statement1: nodes
	| result |
	result := CSCheckedStatementNode new.
	result checkedToken: (nodes at: 1).
	result block: (nodes at: 2).
	^ result