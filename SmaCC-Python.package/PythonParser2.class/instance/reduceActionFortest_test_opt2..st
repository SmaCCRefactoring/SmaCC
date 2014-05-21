generated-reduction actions
reduceActionFortest_test_opt2: nodes
	| result |
	result := Array new: 42.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 4 put: (OrderedCollection new: 2).
	result at: 5 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
	result at: 7 put: (OrderedCollection new: 2).
	result at: 8 put: (OrderedCollection new: 2).
	result at: 9 put: (OrderedCollection new: 2).
	result at: 10 put: (OrderedCollection new: 2).
	result at: 11 put: (OrderedCollection new: 2).
	result at: 12 put: (OrderedCollection new: 2).
	result at: 13 put: (OrderedCollection new: 2).
	result at: 14 put: (OrderedCollection new: 2).
	result at: 15 put: (OrderedCollection new: 2).
	result at: 16 put: (OrderedCollection new: 2).
	result at: 17 put: (OrderedCollection new: 2).
	result at: 18 put: (OrderedCollection new: 2).
	result at: 19 put: (OrderedCollection new: 2).
	result at: 20 put: (OrderedCollection new: 2).
	result at: 21 put: (OrderedCollection new: 2).
	result at: 22 put: (OrderedCollection new: 2).
	result at: 23 put: (OrderedCollection new: 2).
	result at: 24 put: (OrderedCollection new: 2).
	result at: 25 put: (OrderedCollection new: 2).
	result at: 26 put: (OrderedCollection new: 2).
	result at: 27 put: (OrderedCollection new: 2).
	result at: 28 put: (OrderedCollection new: 2).
	result at: 29 put: (OrderedCollection new: 2).
	result at: 30 put: (OrderedCollection new: 2).
	result at: 31 put: (OrderedCollection new: 2).
	result at: 32 put: (OrderedCollection new: 2).
	result at: 33 put: (OrderedCollection new: 2).
	result at: 34 put: (OrderedCollection new: 2).
	result at: 35 put: (OrderedCollection new: 2).
	result at: 36 put: (OrderedCollection new: 2).
	result at: 37 put: (OrderedCollection new: 2).
	result at: 38 put: (OrderedCollection new: 2).
	result at: 39 put: (OrderedCollection new: 2).
	result at: 40 put: (OrderedCollection new: 2).
	result at: 41 put: (OrderedCollection new: 2).
	result at: 42 put: (OrderedCollection new: 2).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #notTokens variableGetter: nil)
		to: (result at: 1).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #upArrowTokens variableGetter: nil)
		to: (result at: 2).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #orTokens variableGetter: nil)
		to: (result at: 3).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #andTokens variableGetter: nil)
		to: (result at: 4).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #lessThanTokens variableGetter: nil)
		to: (result at: 5).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #greaterThanTokens variableGetter: nil)
		to: (result at: 6).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #equalEqualTokens variableGetter: nil)
		to: (result at: 7).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #greaterThanEqualTokens variableGetter: nil)
		to: (result at: 8).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #lessThanEqualTokens variableGetter: nil)
		to: (result at: 9).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #lessThanGreaterThanTokens variableGetter: nil)
		to: (result at: 10).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #bangEqualTokens variableGetter: nil)
		to: (result at: 11).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #inTokens variableGetter: nil)
		to: (result at: 12).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #isTokens variableGetter: nil)
		to: (result at: 13).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #plusTokens variableGetter: nil)
		to: (result at: 14).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #minusTokens variableGetter: nil)
		to: (result at: 15).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #lessThanLessThanTokens variableGetter: nil)
		to: (result at: 16).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #greaterThanGreaterThanTokens variableGetter: nil)
		to: (result at: 17).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #tildeTokens variableGetter: nil)
		to: (result at: 18).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #timesTokens variableGetter: nil)
		to: (result at: 19).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #divideTokens variableGetter: nil)
		to: (result at: 20).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #percentTokens variableGetter: nil)
		to: (result at: 21).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #divideDivideTokens variableGetter: nil)
		to: (result at: 22).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #timesTimesTokens variableGetter: nil)
		to: (result at: 23).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #lparenTokens variableGetter: #lparenToken)
		to: (result at: 24).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #rparenTokens variableGetter: #rparenToken)
		to: (result at: 25).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #yieldTokens variableGetter: nil)
		to: (result at: 26).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #lbrackTokens variableGetter: nil)
		to: (result at: 27).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #rbrackTokens variableGetter: nil)
		to: (result at: 28).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #lcurlyTokens variableGetter: nil)
		to: (result at: 29).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #rcurlyTokens variableGetter: nil)
		to: (result at: 30).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #_Tokens variableGetter: nil)
		to: (result at: 31).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #nameTokens variableGetter: nil)
		to: (result at: 32).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #numberTokens variableGetter: nil)
		to: (result at: 33).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #commaTokens variableGetter: #commaToken)
		to: (result at: 34).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #ifTokens variableGetter: nil)
		to: (result at: 35).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #elseTokens variableGetter: nil)
		to: (result at: 36).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #colonTokens variableGetter: #colonToken)
		to: (result at: 37).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #stringTokens variableGetter: nil)
		to: (result at: 38).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #periodTokens variableGetter: nil)
		to: (result at: 39).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #forTokens variableGetter: nil)
		to: (result at: 40).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #equalTokens variableGetter: nil)
		to: (result at: 41).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #lambdaTokens variableGetter: nil)
		to: (result at: 42).
	self add: (nodes at: 2) to: (result at: 34).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #notTokens variableGetter: nil)
		to: (result at: 1).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #upArrowTokens variableGetter: nil)
		to: (result at: 2).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #orTokens variableGetter: nil)
		to: (result at: 3).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #andTokens variableGetter: nil)
		to: (result at: 4).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #lessThanTokens variableGetter: nil)
		to: (result at: 5).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #greaterThanTokens variableGetter: nil)
		to: (result at: 6).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #equalEqualTokens variableGetter: nil)
		to: (result at: 7).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #greaterThanEqualTokens variableGetter: nil)
		to: (result at: 8).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #lessThanEqualTokens variableGetter: nil)
		to: (result at: 9).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #lessThanGreaterThanTokens variableGetter: nil)
		to: (result at: 10).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #bangEqualTokens variableGetter: nil)
		to: (result at: 11).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #inTokens variableGetter: nil)
		to: (result at: 12).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #isTokens variableGetter: nil)
		to: (result at: 13).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #plusTokens variableGetter: nil)
		to: (result at: 14).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #minusTokens variableGetter: nil)
		to: (result at: 15).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #lessThanLessThanTokens variableGetter: nil)
		to: (result at: 16).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #greaterThanGreaterThanTokens variableGetter: nil)
		to: (result at: 17).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #tildeTokens variableGetter: nil)
		to: (result at: 18).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #timesTokens variableGetter: nil)
		to: (result at: 19).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #divideTokens variableGetter: nil)
		to: (result at: 20).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #percentTokens variableGetter: nil)
		to: (result at: 21).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #divideDivideTokens variableGetter: nil)
		to: (result at: 22).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #timesTimesTokens variableGetter: nil)
		to: (result at: 23).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #lparenTokens variableGetter: #lparenToken)
		to: (result at: 24).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #rparenTokens variableGetter: #rparenToken)
		to: (result at: 25).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #yieldTokens variableGetter: nil)
		to: (result at: 26).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #lbrackTokens variableGetter: nil)
		to: (result at: 27).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #rbrackTokens variableGetter: nil)
		to: (result at: 28).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #lcurlyTokens variableGetter: nil)
		to: (result at: 29).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #rcurlyTokens variableGetter: nil)
		to: (result at: 30).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #_Tokens variableGetter: nil)
		to: (result at: 31).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #nameTokens variableGetter: nil)
		to: (result at: 32).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #numberTokens variableGetter: nil)
		to: (result at: 33).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #commaTokens variableGetter: #commaToken)
		to: (result at: 34).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #ifTokens variableGetter: nil)
		to: (result at: 35).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #elseTokens variableGetter: nil)
		to: (result at: 36).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #colonTokens variableGetter: #colonToken)
		to: (result at: 37).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #stringTokens variableGetter: nil)
		to: (result at: 38).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #periodTokens variableGetter: nil)
		to: (result at: 39).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #forTokens variableGetter: nil)
		to: (result at: 40).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #equalTokens variableGetter: nil)
		to: (result at: 41).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 3) collectionGetter: #lambdaTokens variableGetter: nil)
		to: (result at: 42).
	^ result