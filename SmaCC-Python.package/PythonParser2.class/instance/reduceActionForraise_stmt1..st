generated-reduction actions
reduceActionForraise_stmt1: nodes
	| result |
	result := PyRaiseNode new.
	result raiseToken: (nodes at: 1).
	^ result