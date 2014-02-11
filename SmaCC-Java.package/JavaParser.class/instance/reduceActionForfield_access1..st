generated-reduction actions
reduceActionForfield_access1: nodes
	| result |
	result := JavaFieldAccessNode new.
	result receiver: (nodes at: 1).
	result period: (nodes at: 2).
	result _name: (nodes at: 3).
	^ result