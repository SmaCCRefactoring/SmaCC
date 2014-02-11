generated-reduction actions
reduceActionForelementValuePair1: nodes
	| result |
	result := JavaElementValuePairNode new.
	result _name: (nodes at: 1).
	result equals: (nodes at: 2).
	result _value: (nodes at: 3).
	^ result