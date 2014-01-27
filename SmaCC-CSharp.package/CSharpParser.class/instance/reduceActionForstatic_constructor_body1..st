generated
reduceActionForstatic_constructor_body1: nodes
	| result |
	result := Array new: 4.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 1 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #leftBraceToken).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 1)
				collectionGetter: #statements
				variableGetter: nil)
		to: (result at: 2).
	result at: 3 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #rightBraceToken).
	^result