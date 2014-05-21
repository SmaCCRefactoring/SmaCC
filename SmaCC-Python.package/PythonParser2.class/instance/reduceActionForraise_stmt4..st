generated-reduction actions
reduceActionForraise_stmt4: nodes
	| result |
	result := Array new: 43.
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
	result at: 43 put: (OrderedCollection new: 2).
	result at: 1 put: (nodes at: 1).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #notTokens variableGetter: nil)
		to: (result at: 2).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #upArrowTokens variableGetter: nil)
		to: (result at: 3).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #orTokens variableGetter: nil)
		to: (result at: 4).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #andTokens variableGetter: nil)
		to: (result at: 5).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #lessThanTokens variableGetter: nil)
		to: (result at: 6).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #greaterThanTokens variableGetter: nil)
		to: (result at: 7).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #equalEqualTokens variableGetter: nil)
		to: (result at: 8).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #greaterThanEqualTokens variableGetter: nil)
		to: (result at: 9).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #lessThanEqualTokens variableGetter: nil)
		to: (result at: 10).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #lessThanGreaterThanTokens variableGetter: nil)
		to: (result at: 11).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #bangEqualTokens variableGetter: nil)
		to: (result at: 12).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #inTokens variableGetter: nil)
		to: (result at: 13).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #isTokens variableGetter: nil)
		to: (result at: 14).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #plusTokens variableGetter: nil)
		to: (result at: 15).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #minusTokens variableGetter: nil)
		to: (result at: 16).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #lessThanLessThanTokens variableGetter: nil)
		to: (result at: 17).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #greaterThanGreaterThanTokens variableGetter: nil)
		to: (result at: 18).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #tildeTokens variableGetter: nil)
		to: (result at: 19).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #timesTokens variableGetter: nil)
		to: (result at: 20).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #divideTokens variableGetter: nil)
		to: (result at: 21).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #percentTokens variableGetter: nil)
		to: (result at: 22).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #divideDivideTokens variableGetter: nil)
		to: (result at: 23).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #timesTimesTokens variableGetter: nil)
		to: (result at: 24).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #lparenTokens variableGetter: #lparenToken)
		to: (result at: 25).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #rparenTokens variableGetter: #rparenToken)
		to: (result at: 26).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #yieldTokens variableGetter: nil)
		to: (result at: 27).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #lbrackTokens variableGetter: nil)
		to: (result at: 28).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #rbrackTokens variableGetter: nil)
		to: (result at: 29).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #lcurlyTokens variableGetter: nil)
		to: (result at: 30).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #rcurlyTokens variableGetter: nil)
		to: (result at: 31).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #_Tokens variableGetter: nil)
		to: (result at: 32).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #nameTokens variableGetter: nil)
		to: (result at: 33).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #numberTokens variableGetter: nil)
		to: (result at: 34).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #commaTokens variableGetter: #commaToken)
		to: (result at: 35).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #ifTokens variableGetter: nil)
		to: (result at: 36).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #elseTokens variableGetter: nil)
		to: (result at: 37).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #colonTokens variableGetter: #colonToken)
		to: (result at: 38).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #stringTokens variableGetter: nil)
		to: (result at: 39).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #periodTokens variableGetter: nil)
		to: (result at: 40).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #forTokens variableGetter: nil)
		to: (result at: 41).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #equalTokens variableGetter: nil)
		to: (result at: 42).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 2) collectionGetter: #lambdaTokens variableGetter: nil)
		to: (result at: 43).
	self add: (nodes at: 3) to: (result at: 35).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #notTokens variableGetter: nil)
		to: (result at: 2).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #upArrowTokens variableGetter: nil)
		to: (result at: 3).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #orTokens variableGetter: nil)
		to: (result at: 4).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #andTokens variableGetter: nil)
		to: (result at: 5).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #lessThanTokens variableGetter: nil)
		to: (result at: 6).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #greaterThanTokens variableGetter: nil)
		to: (result at: 7).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #equalEqualTokens variableGetter: nil)
		to: (result at: 8).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #greaterThanEqualTokens variableGetter: nil)
		to: (result at: 9).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #lessThanEqualTokens variableGetter: nil)
		to: (result at: 10).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #lessThanGreaterThanTokens variableGetter: nil)
		to: (result at: 11).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #bangEqualTokens variableGetter: nil)
		to: (result at: 12).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #inTokens variableGetter: nil)
		to: (result at: 13).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #isTokens variableGetter: nil)
		to: (result at: 14).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #plusTokens variableGetter: nil)
		to: (result at: 15).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #minusTokens variableGetter: nil)
		to: (result at: 16).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #lessThanLessThanTokens variableGetter: nil)
		to: (result at: 17).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #greaterThanGreaterThanTokens variableGetter: nil)
		to: (result at: 18).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #tildeTokens variableGetter: nil)
		to: (result at: 19).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #timesTokens variableGetter: nil)
		to: (result at: 20).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #divideTokens variableGetter: nil)
		to: (result at: 21).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #percentTokens variableGetter: nil)
		to: (result at: 22).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #divideDivideTokens variableGetter: nil)
		to: (result at: 23).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #timesTimesTokens variableGetter: nil)
		to: (result at: 24).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #lparenTokens variableGetter: #lparenToken)
		to: (result at: 25).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #rparenTokens variableGetter: #rparenToken)
		to: (result at: 26).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #yieldTokens variableGetter: nil)
		to: (result at: 27).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #lbrackTokens variableGetter: nil)
		to: (result at: 28).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #rbrackTokens variableGetter: nil)
		to: (result at: 29).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #lcurlyTokens variableGetter: nil)
		to: (result at: 30).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #rcurlyTokens variableGetter: nil)
		to: (result at: 31).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #_Tokens variableGetter: nil)
		to: (result at: 32).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #nameTokens variableGetter: nil)
		to: (result at: 33).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #numberTokens variableGetter: nil)
		to: (result at: 34).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #commaTokens variableGetter: #commaToken)
		to: (result at: 35).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #ifTokens variableGetter: nil)
		to: (result at: 36).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #elseTokens variableGetter: nil)
		to: (result at: 37).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #colonTokens variableGetter: #colonToken)
		to: (result at: 38).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #stringTokens variableGetter: nil)
		to: (result at: 39).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #periodTokens variableGetter: nil)
		to: (result at: 40).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #forTokens variableGetter: nil)
		to: (result at: 41).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #equalTokens variableGetter: nil)
		to: (result at: 42).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 4) collectionGetter: #lambdaTokens variableGetter: nil)
		to: (result at: 43).
	self add: (nodes at: 5) to: (result at: 35).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #notTokens variableGetter: nil)
		to: (result at: 2).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #upArrowTokens variableGetter: nil)
		to: (result at: 3).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #orTokens variableGetter: nil)
		to: (result at: 4).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #andTokens variableGetter: nil)
		to: (result at: 5).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #lessThanTokens variableGetter: nil)
		to: (result at: 6).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #greaterThanTokens variableGetter: nil)
		to: (result at: 7).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #equalEqualTokens variableGetter: nil)
		to: (result at: 8).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #greaterThanEqualTokens variableGetter: nil)
		to: (result at: 9).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #lessThanEqualTokens variableGetter: nil)
		to: (result at: 10).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #lessThanGreaterThanTokens variableGetter: nil)
		to: (result at: 11).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #bangEqualTokens variableGetter: nil)
		to: (result at: 12).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #inTokens variableGetter: nil)
		to: (result at: 13).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #isTokens variableGetter: nil)
		to: (result at: 14).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #plusTokens variableGetter: nil)
		to: (result at: 15).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #minusTokens variableGetter: nil)
		to: (result at: 16).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #lessThanLessThanTokens variableGetter: nil)
		to: (result at: 17).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #greaterThanGreaterThanTokens variableGetter: nil)
		to: (result at: 18).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #tildeTokens variableGetter: nil)
		to: (result at: 19).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #timesTokens variableGetter: nil)
		to: (result at: 20).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #divideTokens variableGetter: nil)
		to: (result at: 21).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #percentTokens variableGetter: nil)
		to: (result at: 22).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #divideDivideTokens variableGetter: nil)
		to: (result at: 23).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #timesTimesTokens variableGetter: nil)
		to: (result at: 24).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #lparenTokens variableGetter: #lparenToken)
		to: (result at: 25).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #rparenTokens variableGetter: #rparenToken)
		to: (result at: 26).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #yieldTokens variableGetter: nil)
		to: (result at: 27).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #lbrackTokens variableGetter: nil)
		to: (result at: 28).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #rbrackTokens variableGetter: nil)
		to: (result at: 29).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #lcurlyTokens variableGetter: nil)
		to: (result at: 30).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #rcurlyTokens variableGetter: nil)
		to: (result at: 31).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #_Tokens variableGetter: nil)
		to: (result at: 32).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #nameTokens variableGetter: nil)
		to: (result at: 33).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #numberTokens variableGetter: nil)
		to: (result at: 34).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #commaTokens variableGetter: #commaToken)
		to: (result at: 35).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #ifTokens variableGetter: nil)
		to: (result at: 36).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #elseTokens variableGetter: nil)
		to: (result at: 37).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #colonTokens variableGetter: #colonToken)
		to: (result at: 38).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #stringTokens variableGetter: nil)
		to: (result at: 39).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #periodTokens variableGetter: nil)
		to: (result at: 40).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #forTokens variableGetter: nil)
		to: (result at: 41).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #equalTokens variableGetter: nil)
		to: (result at: 42).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 6) collectionGetter: #lambdaTokens variableGetter: nil)
		to: (result at: 43).
	^ result