generated-reduction actions
reduceActionForsmall_stmt6: nodes
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
	result at: 34 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #importToken).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #commaTokens variableGetter: nil)
		to: (result at: 2).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #names variableGetter: nil)
		to: (result at: 35).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #asTokens variableGetter: nil)
		to: (result at: 36).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #renames variableGetter: nil)
		to: (result at: 37).
	result at: 38 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #fromToken).
	result at: 39 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #from).
	result at: 40 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #timesToken).
	result at: 41 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #lparenToken).
	result at: 42 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #rparenToken).
	^ result