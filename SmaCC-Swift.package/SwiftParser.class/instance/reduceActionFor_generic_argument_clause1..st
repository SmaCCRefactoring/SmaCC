generated-reduction actions
reduceActionFor_generic_argument_clause1: nodes
	| result |
	result := Array new: 3.
	result at: 2 put: (OrderedCollection new: 2).
	^ result