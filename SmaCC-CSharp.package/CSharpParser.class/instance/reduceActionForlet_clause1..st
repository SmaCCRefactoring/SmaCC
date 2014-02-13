generated-reduction actions
reduceActionForlet_clause1: nodes
	| result |
	result := Array new: 8.
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: (nodes at: 2).
	result at: 3 put: (nodes at: 3).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #_leftParens variableGetter: nil)
		to: (result at: 4).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #_rightParens variableGetter: nil)
		to: (result at: 5).
	result at: 6 put: (SmaCCParseNode variableIn: (nodes at: 4) getter: #lhs).
	result at: 7 put: (SmaCCParseNode variableIn: (nodes at: 4) getter: #operator).
	result at: 8 put: (SmaCCParseNode variableIn: (nodes at: 4) getter: #rhs).
	^ result