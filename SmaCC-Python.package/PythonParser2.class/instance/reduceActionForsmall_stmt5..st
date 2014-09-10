generated-reduction actions
reduceActionForsmall_stmt5: nodes
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
	result at: 26 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #breakToken).
	result at: 27 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #continueToken).
	result at: 28 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #returnToken).
	result at: 29 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #args).
	result at: 30 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #raiseToken).
	result at: 31 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #arg1).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #commaTokens variableGetter: nil)
		to: (result at: 2).
	result at: 32 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #arg2).
	result at: 33 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #arg3).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #yieldTokens variableGetter: #yieldToken)
		to: (result at: 4).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #argumentses variableGetter: #arguments)
		to: (result at: 5).
	^ result