generated-reduction actions
reduceActionForsmall_stmt3: nodes
	| result |
	result := Array new: 55.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 44 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 20 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #delToken).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #trailers variableGetter: nil)
		to: (result at: 21).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #ones variableGetter: nil)
		to: (result at: 22).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #orTokens variableGetter: nil)
		to: (result at: 23).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #twos variableGetter: nil)
		to: (result at: 24).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #commaTokens variableGetter: nil)
		to: (result at: 2).
	^ result