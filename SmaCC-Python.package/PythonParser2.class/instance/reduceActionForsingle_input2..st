generated-reduction actions
reduceActionForsingle_input2: nodes
	| result |
	result := PySingleInputNode new.
	result statement: (nodes at: 1).
	^ result