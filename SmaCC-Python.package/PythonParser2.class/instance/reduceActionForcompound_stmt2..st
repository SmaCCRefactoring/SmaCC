generated-reduction actions
reduceActionForcompound_stmt2: nodes
	| result |
	result := Array new: 77.
	result at: 1 put: (OrderedCollection new: 2).
	result at: 2 put: (OrderedCollection new: 2).
	result at: 3 put: (OrderedCollection new: 2).
	result at: 6 put: (OrderedCollection new: 2).
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
	result at: 44 put: (OrderedCollection new: 2).
	result at: 45 put: (OrderedCollection new: 2).
	result at: 46 put: (OrderedCollection new: 2).
	result at: 47 put: (OrderedCollection new: 2).
	result at: 48 put: (OrderedCollection new: 2).
	result at: 49 put: (OrderedCollection new: 2).
	result at: 50 put: (OrderedCollection new: 2).
	result at: 51 put: (OrderedCollection new: 2).
	result at: 52 put: (OrderedCollection new: 2).
	result at: 53 put: (OrderedCollection new: 2).
	result at: 54 put: (OrderedCollection new: 2).
	result at: 55 put: (OrderedCollection new: 2).
	result at: 56 put: (OrderedCollection new: 2).
	result at: 57 put: (OrderedCollection new: 2).
	result at: 58 put: (OrderedCollection new: 2).
	result at: 59 put: (OrderedCollection new: 2).
	result at: 60 put: (OrderedCollection new: 2).
	result at: 61 put: (OrderedCollection new: 2).
	result at: 62 put: (OrderedCollection new: 2).
	result at: 63 put: (OrderedCollection new: 2).
	result at: 64 put: (OrderedCollection new: 2).
	result at: 65 put: (OrderedCollection new: 2).
	result at: 67 put: (OrderedCollection new: 2).
	result at: 75 put: (OrderedCollection new: 2).
	result at: 76 put: (OrderedCollection new: 2).
	result at: 77 put: (OrderedCollection new: 2).
	result at: 7 put: (SmaCCParseNode variableIn: (nodes at: 1) getter: #whileToken).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #trailers variableGetter: nil)
		to: (result at: 8).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #ones variableGetter: nil)
		to: (result at: 9).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #orTokens variableGetter: nil)
		to: (result at: 10).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #twos variableGetter: nil)
		to: (result at: 11).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #ifTokens variableGetter: nil)
		to: (result at: 1).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #ifs variableGetter: nil)
		to: (result at: 2).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #elseTokens variableGetter: nil)
		to: (result at: 12).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #elses variableGetter: nil)
		to: (result at: 6).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #lambdaTokens variableGetter: nil)
		to: (result at: 13).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #argumentses variableGetter: nil)
		to: (result at: 14).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #colonTokens variableGetter: nil)
		to: (result at: 3).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #bodies variableGetter: nil)
		to: (result at: 15).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #tests variableGetter: nil)
		to: (result at: 16).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #commaTokens variableGetter: nil)
		to: (result at: 17).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #equalTokens variableGetter: nil)
		to: (result at: 18).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #yieldTokens variableGetter: nil)
		to: (result at: 19).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #plusEqualToken)
		to: (result at: 20).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #minusEqualToken)
		to: (result at: 21).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #timesEqualToken)
		to: (result at: 22).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #divideEqualToken)
		to: (result at: 23).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #percentEqualToken)
		to: (result at: 24).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #andEqualToken)
		to: (result at: 25).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #orEqualToken)
		to: (result at: 26).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #upArrowEqualToken)
		to: (result at: 27).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #lessThanLessThanEqualToken)
		to: (result at: 28).
	self
		addAll:
			(SmaCCParseNode
				collectionVariableIn: (nodes at: 1)
				collectionGetter: nil
				variableGetter: #greaterThanGreaterThanEqualToken)
		to: (result at: 29).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #timesTimesEqualToken)
		to: (result at: 30).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #divideDivideEqualToken)
		to: (result at: 31).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #printToken)
		to: (result at: 32).
	self
		addAll:
			(SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #greaterThanGreaterThanToken)
		to: (result at: 33).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #delToken)
		to: (result at: 34).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #passToken)
		to: (result at: 35).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #breakToken)
		to: (result at: 36).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #continueToken)
		to: (result at: 37).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #returnToken)
		to: (result at: 38).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #args)
		to: (result at: 39).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #raiseToken)
		to: (result at: 40).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #arg1)
		to: (result at: 41).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #arg2)
		to: (result at: 42).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #arg3)
		to: (result at: 43).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #importToken)
		to: (result at: 44).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #names variableGetter: nil)
		to: (result at: 45).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #asTokens variableGetter: nil)
		to: (result at: 46).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #renames variableGetter: nil)
		to: (result at: 47).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #fromToken)
		to: (result at: 48).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #from)
		to: (result at: 49).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #timesToken)
		to: (result at: 50).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #lparenToken)
		to: (result at: 51).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #rparenToken)
		to: (result at: 52).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #globalToken)
		to: (result at: 53).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #nameTokens variableGetter: nil)
		to: (result at: 54).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #execToken)
		to: (result at: 55).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #inToken)
		to: (result at: 56).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #assertToken)
		to: (result at: 57).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #condition)
		to: (result at: 58).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #semicolonToken)
		to: (result at: 59).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #simple)
		to: (result at: 60).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #nEWLINEToken)
		to: (result at: 61).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #iNDENTToken)
		to: (result at: 62).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: #statements variableGetter: nil)
		to: (result at: 63).
	self
		addAll: (SmaCCParseNode collectionVariableIn: (nodes at: 1) collectionGetter: nil variableGetter: #dEDENTToken)
		to: (result at: 64).
	^ result