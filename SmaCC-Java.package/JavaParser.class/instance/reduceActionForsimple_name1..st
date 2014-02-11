generated-reduction actions
reduceActionForsimple_name1: nodes
	| result |
	result := JavaNameNode new.
	result _name: (nodes at: 1).
	^ result