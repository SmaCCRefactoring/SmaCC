generated-reduction actions
reduceActionFortest3: nodes
	| result |
	result := Array new: 12.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 9 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #lambdaToken).
	result at: 10 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #arguments).
	result at: 11 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #colonToken).
	result at: 12 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #body).
	^ result