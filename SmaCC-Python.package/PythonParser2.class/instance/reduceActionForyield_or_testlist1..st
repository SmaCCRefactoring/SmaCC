generated-reduction actions
reduceActionForyield_or_testlist1: nodes
	| result |
	result := Array new: 4.
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 1 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #yieldToken).
	result at: 2 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #arguments).
	^ result