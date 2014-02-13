generated-reduction actions
reduceActionFornamed_argument1: nodes
	| result |
	result := CSNamedArgumentNode new.
	result _name: (nodes at: 1).
	result equal: (nodes at: 2).
	result _value: (nodes at: 3).
	^ result