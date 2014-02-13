generated-reduction actions
reduceActionForselect_clause1: nodes
	| result |
	result := Array new: 6.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #_leftParens variableGetter: nil)
		to: (result at: 2).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #_rightParens variableGetter: nil)
		to: (result at: 3).
	result at: 4 put: (SmaCCParseNode variableIn: (nodes at: 2) getter: #lhs).
	result at: 5 put: (SmaCCParseNode variableIn: (nodes at: 2) getter: #operator).
	result at: 6 put: (SmaCCParseNode variableIn: (nodes at: 2) getter: #rhs).
	^ result