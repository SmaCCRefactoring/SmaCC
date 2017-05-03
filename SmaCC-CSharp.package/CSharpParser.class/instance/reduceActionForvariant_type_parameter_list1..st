generated-reduction actions
reduceActionForvariant_type_parameter_list1: nodes
	| result |
	result := CSVariantTypeParameterListNode new.
	result lessThan: (nodes at: 1).
	result addNodes: ((nodes at: 2) at: 1) to: result _attributes.
	result addTokens: ((nodes at: 2) at: 2) to: result annotations.
	result addNodes: ((nodes at: 2) at: 3) to: result parameters.
	result addTokens: ((nodes at: 2) at: 4) to: result commaTokens.
	result greaterThan: (nodes at: 3).
	^ result