generated
reduceActionForordering1: nodes
	| result |
	result := Array new: 7.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 1)
				collectionGetter: #_leftParens
				variableGetter: nil)
		to: (result at: 1).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 1)
				collectionGetter: #_rightParens
				variableGetter: nil)
		to: (result at: 2).
	result at: 3 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #lhs).
	result at: 4 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #operator).
	result at: 5 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #rhs).
	result at: 6 put: ((nodes at: 2) at: 1).
	result at: 7 put: ((nodes at: 2) at: 2).
	^result