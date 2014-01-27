generated
reduceActionForjoin_clause1: nodes
	| result |
	result := Array new: 11.
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	result at: 2 put: ((nodes at: 2) at: 1).
	result at: 3 put: (nodes at: 3).
	result at: 4 put: (nodes at: 4).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 5)
				collectionGetter: #_leftParens
				variableGetter: nil)
		to: (result at: 5).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 5)
				collectionGetter: #_rightParens
				variableGetter: nil)
		to: (result at: 6).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 5)
				collectionGetter: #lhses
				variableGetter: #lhs)
		to: (result at: 7).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 5)
				collectionGetter: #operators
				variableGetter: #operator)
		to: (result at: 8).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 5)
				collectionGetter: #rhses
				variableGetter: #rhs)
		to: (result at: 9).
	result at: 10 put: (nodes at: 6).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 7)
				collectionGetter: #_leftParens
				variableGetter: nil)
		to: (result at: 5).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 7)
				collectionGetter: #_rightParens
				variableGetter: nil)
		to: (result at: 6).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 7)
				collectionGetter: #lhses
				variableGetter: #lhs)
		to: (result at: 7).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 7)
				collectionGetter: #operators
				variableGetter: #operator)
		to: (result at: 8).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 7)
				collectionGetter: #rhses
				variableGetter: #rhs)
		to: (result at: 9).
	result at: 11 put: (nodes at: 8).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 9)
				collectionGetter: #_leftParens
				variableGetter: nil)
		to: (result at: 5).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 9)
				collectionGetter: #_rightParens
				variableGetter: nil)
		to: (result at: 6).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 9)
				collectionGetter: #lhses
				variableGetter: #lhs)
		to: (result at: 7).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 9)
				collectionGetter: #operators
				variableGetter: #operator)
		to: (result at: 8).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 9)
				collectionGetter: #rhses
				variableGetter: #rhs)
		to: (result at: 9).
	^result