generated-reduction actions
reduceActionForexec_stmt1: nodes
	| result |
	result := PyExecNode new.
	result execToken: (nodes at: 1).
	result expr: (nodes at: 2).
	^ result