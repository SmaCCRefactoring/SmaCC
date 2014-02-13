generated-reduction actions
reduceActionForfrom_clause1: nodes
	| result |
	result := Array new: 9.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 5) collectionGetter: #_leftParens variableGetter: nil)
		to: (result at: 5).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 5) collectionGetter: #_rightParens variableGetter: nil)
		to: (result at: 6).
	result at: 7 put: (SmaCCParseNode variableIn: (nodes at: 5) getter: #lhs).
	result at: 8 put: (SmaCCParseNode variableIn: (nodes at: 5) getter: #operator).
	result at: 9 put: (SmaCCParseNode variableIn: (nodes at: 5) getter: #rhs).
	^ result