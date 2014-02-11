generated-reduction actions
reduceActionForprimary_no_new_array8: nodes
	| result |
	result := JavaClassPropertyNode new.
	result type: (nodes at: 1).
	result period: (nodes at: 2).
	result classToken: (nodes at: 3).
	^ result