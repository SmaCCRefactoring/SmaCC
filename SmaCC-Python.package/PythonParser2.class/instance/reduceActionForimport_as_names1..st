generated-reduction actions
reduceActionForimport_as_names1: nodes
	| result |
	result := Array new: 3.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	self addAll: ((nodes at: 1) at: 1) to: (result at: 1).
	self addAll: ((nodes at: 1) at: 2) to: (result at: 2).
	self addAll: ((nodes at: 1) at: 3) to: (result at: 3).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: nil variableGetter: #commaToken)
		to: (result at: 1).
	^ result