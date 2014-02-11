generated-reduction actions
reduceActionForliteral6: nodes
	| result |
	result := JavaNullNode new.
	result token: (nodes at: 1).
	^ result