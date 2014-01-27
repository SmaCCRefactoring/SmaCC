generated
reduceActionFormember_initializer_list1: nodes
	| result |
	result := Array new: 4.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 1)
				collectionGetter: nil
				variableGetter: #identifier)
		to: (result at: 1).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 1)
				collectionGetter: nil
				variableGetter: #equalToken)
		to: (result at: 2).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 1)
				collectionGetter: nil
				variableGetter: #value)
		to: (result at: 3).
	^result