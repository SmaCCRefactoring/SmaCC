generated
reduceActionForswitch_block_statement_group1: nodes
	| result |
	result := JavaSwitchBlockStatementGroupNode new.
	result addNodes: ((nodes at: 1) at: 1) to: result labels.
	result addNodes: ((nodes at: 2) at: 1) to: result statements.
	^result