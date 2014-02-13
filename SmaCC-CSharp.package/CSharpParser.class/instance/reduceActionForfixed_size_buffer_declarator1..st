generated-reduction actions
reduceActionForfixed_size_buffer_declarator1: nodes
	| result |
	result := CSFixedSizeBufferDeclaratorNode new.
	result _name: (nodes at: 1).
	result leftBracketToken: (nodes at: 2).
	result expression: (nodes at: 3).
	result rightBracketToken: (nodes at: 4).
	^ result