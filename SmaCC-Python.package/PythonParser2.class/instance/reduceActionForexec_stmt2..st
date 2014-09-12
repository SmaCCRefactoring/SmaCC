generated-reduction actions
reduceActionForexec_stmt2: nodes
	| result |
	result := PyExecNode new.
	result execToken: (nodes at: 1).
	result expr: (nodes at: 2).
	result inToken: (nodes at: 3).
	result test1: ((nodes at: 4) at: 1).
	result commaToken: ((nodes at: 4) at: 2).
	result test2: ((nodes at: 4) at: 3).
	^ result