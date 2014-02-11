generated-reduction actions
reduceActionForenum_body_declarations_opt1: nodes
	| result |
	result := Array new: 2.
	result at: 2 put: (OrderedCollection new: 2).
	^ result