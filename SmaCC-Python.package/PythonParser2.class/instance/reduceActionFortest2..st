generated-reduction actions
reduceActionFortest2: nodes
	| result |
	result := Array new: 12.
	result at: 1 put: (OrderedCollection new: 2).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #trailers variableGetter: nil)
		to: (result at: 1).
	result at: 2 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #one).
	result at: 3 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #orToken).
	result at: 4 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #two).
	result at: 5 put: (nodes at: 2).
	result at: 6 put: (nodes at: 3).
	result at: 7 put: (nodes at: 4).
	result at: 8 put: (nodes at: 5).
	^ result