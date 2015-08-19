generated-reduction actions
reduceActionFor_implicit_anonymous_function_parameter_list1: nodes
	| result |
	result := Array new: 2.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	^ result