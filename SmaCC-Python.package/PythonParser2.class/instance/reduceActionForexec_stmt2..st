generated-reduction actions
reduceActionForexec_stmt2: nodes
	| result |
	result := Array new: 15.
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #trailers variableGetter: nil)
		to: (result at: 2).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #ones variableGetter: #one)
		to: (result at: 3).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #orTokens variableGetter: #orToken)
		to: (result at: 4).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #twos variableGetter: #two)
		to: (result at: 5).
	result at: 6 put: (nodes at: 3).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 4) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 4) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 4) at: 5) to: (result at: 7).
	self addAll: ((nodes at: 4) at: 6) to: (result at: 8).
	self addAll: ((nodes at: 4) at: 7) to: (result at: 9).
	self addAll: ((nodes at: 4) at: 8) to: (result at: 10).
	self addAll: ((nodes at: 4) at: 9) to: (result at: 11).
	self addAll: ((nodes at: 4) at: 10) to: (result at: 12).
	self addAll: ((nodes at: 4) at: 11) to: (result at: 13).
	self addAll: ((nodes at: 4) at: 12) to: (result at: 14).
	result at: 15 put: ((nodes at: 4) at: 13).
	^ result