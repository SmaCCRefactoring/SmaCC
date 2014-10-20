generated-reduction actions
reduceActionForprimary_no_new_array2: nodes
	| result |
	result := JavaNameNode new.
	result _name: (nodes at: 1).
	^ result