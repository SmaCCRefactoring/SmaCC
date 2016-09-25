generated-reduction actions
reduceActionForprimary_no_new_array11: nodes
	| result |
	result := JavaClassPropertyNode new.
	result name: (nodes at: 1).
	result period: (nodes at: 2).
	result classToken: (nodes at: 3).
	^ result