generated-reduction actions
reduceActionForwhile_stmt1: nodes
	| result |
	result := Array new: 73.
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
	result at: 66 put: (OrderedCollection new: 2).
	result at: 67 put: (OrderedCollection new: 2).
	result at: 68 put: (OrderedCollection new: 2).
	result at: 69 put: (OrderedCollection new: 2).
	result at: 70 put: (OrderedCollection new: 2).
	result at: 71 put: (OrderedCollection new: 2).
	result at: 72 put: (OrderedCollection new: 2).
	result at: 73 put: (OrderedCollection new: 2).
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
	self add: (nodes at: 3) to: (result at: 38).
	self addAll: ((nodes at: 4) at: 1) to: (result at: 2).
	self addAll: ((nodes at: 4) at: 2) to: (result at: 3).
	self addAll: ((nodes at: 4) at: 3) to: (result at: 4).
	self addAll: ((nodes at: 4) at: 4) to: (result at: 5).
	self addAll: ((nodes at: 4) at: 5) to: (result at: 6).
	self addAll: ((nodes at: 4) at: 6) to: (result at: 7).
	self addAll: ((nodes at: 4) at: 7) to: (result at: 8).
	self addAll: ((nodes at: 4) at: 8) to: (result at: 9).
	self addAll: ((nodes at: 4) at: 9) to: (result at: 10).
	self addAll: ((nodes at: 4) at: 10) to: (result at: 11).
	self addAll: ((nodes at: 4) at: 11) to: (result at: 12).
	self addAll: ((nodes at: 4) at: 12) to: (result at: 13).
	self addAll: ((nodes at: 4) at: 13) to: (result at: 14).
	self addAll: ((nodes at: 4) at: 14) to: (result at: 15).
	self addAll: ((nodes at: 4) at: 15) to: (result at: 16).
	self addAll: ((nodes at: 4) at: 16) to: (result at: 17).
	self addAll: ((nodes at: 4) at: 17) to: (result at: 18).
	self addAll: ((nodes at: 4) at: 18) to: (result at: 19).
	self addAll: ((nodes at: 4) at: 19) to: (result at: 20).
	self addAll: ((nodes at: 4) at: 20) to: (result at: 21).
	self addAll: ((nodes at: 4) at: 21) to: (result at: 22).
	self addAll: ((nodes at: 4) at: 22) to: (result at: 23).
	self addAll: ((nodes at: 4) at: 23) to: (result at: 36).
	self addAll: ((nodes at: 4) at: 24) to: (result at: 37).
	self addAll: ((nodes at: 4) at: 25) to: (result at: 43).
	self addAll: ((nodes at: 4) at: 26) to: (result at: 38).
	self addAll: ((nodes at: 4) at: 27) to: (result at: 33).
	self addAll: ((nodes at: 4) at: 28) to: (result at: 25).
	self addAll: ((nodes at: 4) at: 29) to: (result at: 26).
	self addAll: ((nodes at: 4) at: 30) to: (result at: 42).
	self addAll: ((nodes at: 4) at: 31) to: (result at: 35).
	self addAll: ((nodes at: 4) at: 32) to: (result at: 24).
	self addAll: ((nodes at: 4) at: 33) to: (result at: 27).
	self addAll: ((nodes at: 4) at: 34) to: (result at: 44).
	self addAll: ((nodes at: 4) at: 35) to: (result at: 45).
	self addAll: ((nodes at: 4) at: 36) to: (result at: 46).
	self addAll: ((nodes at: 4) at: 37) to: (result at: 47).
	self addAll: ((nodes at: 4) at: 38) to: (result at: 48).
	self addAll: ((nodes at: 4) at: 39) to: (result at: 49).
	self addAll: ((nodes at: 4) at: 40) to: (result at: 50).
	self addAll: ((nodes at: 4) at: 41) to: (result at: 51).
	self addAll: ((nodes at: 4) at: 42) to: (result at: 52).
	self addAll: ((nodes at: 4) at: 43) to: (result at: 53).
	self addAll: ((nodes at: 4) at: 44) to: (result at: 54).
	self addAll: ((nodes at: 4) at: 45) to: (result at: 55).
	self addAll: ((nodes at: 4) at: 46) to: (result at: 56).
	self addAll: ((nodes at: 4) at: 47) to: (result at: 57).
	self addAll: ((nodes at: 4) at: 48) to: (result at: 28).
	self addAll: ((nodes at: 4) at: 49) to: (result at: 29).
	self addAll: ((nodes at: 4) at: 50) to: (result at: 30).
	self addAll: ((nodes at: 4) at: 51) to: (result at: 31).
	self addAll: ((nodes at: 4) at: 52) to: (result at: 32).
	self addAll: ((nodes at: 4) at: 53) to: (result at: 34).
	self addAll: ((nodes at: 4) at: 54) to: (result at: 58).
	self addAll: ((nodes at: 4) at: 55) to: (result at: 59).
	self addAll: ((nodes at: 4) at: 56) to: (result at: 60).
	self addAll: ((nodes at: 4) at: 57) to: (result at: 61).
	self addAll: ((nodes at: 4) at: 58) to: (result at: 62).
	self addAll: ((nodes at: 4) at: 59) to: (result at: 63).
	self addAll: ((nodes at: 4) at: 60) to: (result at: 40).
	self addAll: ((nodes at: 4) at: 61) to: (result at: 64).
	self addAll: ((nodes at: 4) at: 62) to: (result at: 65).
	self addAll: ((nodes at: 4) at: 63) to: (result at: 66).
	self addAll: ((nodes at: 4) at: 64) to: (result at: 67).
	self addAll: ((nodes at: 4) at: 65) to: (result at: 39).
	self addAll: ((nodes at: 4) at: 66) to: (result at: 41).
	self addAll: ((nodes at: 4) at: 67) to: (result at: 68).
	self addAll: ((nodes at: 4) at: 68) to: (result at: 69).
	self add: ((nodes at: 4) at: 69) to: (result at: 70).
	self add: ((nodes at: 4) at: 70) to: (result at: 71).
	self addAll: ((nodes at: 4) at: 71) to: (result at: 72).
	self add: ((nodes at: 4) at: 72) to: (result at: 73).
	self addAll: ((nodes at: 5) at: 1) to: (result at: 37).
	self addAll: ((nodes at: 5) at: 2) to: (result at: 38).
	self addAll: ((nodes at: 5) at: 3) to: (result at: 2).
	self addAll: ((nodes at: 5) at: 4) to: (result at: 3).
	self addAll: ((nodes at: 5) at: 5) to: (result at: 4).
	self addAll: ((nodes at: 5) at: 6) to: (result at: 5).
	self addAll: ((nodes at: 5) at: 7) to: (result at: 6).
	self addAll: ((nodes at: 5) at: 8) to: (result at: 7).
	self addAll: ((nodes at: 5) at: 9) to: (result at: 8).
	self addAll: ((nodes at: 5) at: 10) to: (result at: 9).
	self addAll: ((nodes at: 5) at: 11) to: (result at: 10).
	self addAll: ((nodes at: 5) at: 12) to: (result at: 11).
	self addAll: ((nodes at: 5) at: 13) to: (result at: 12).
	self addAll: ((nodes at: 5) at: 14) to: (result at: 13).
	self addAll: ((nodes at: 5) at: 15) to: (result at: 14).
	self addAll: ((nodes at: 5) at: 16) to: (result at: 15).
	self addAll: ((nodes at: 5) at: 17) to: (result at: 16).
	self addAll: ((nodes at: 5) at: 18) to: (result at: 17).
	self addAll: ((nodes at: 5) at: 19) to: (result at: 18).
	self addAll: ((nodes at: 5) at: 20) to: (result at: 19).
	self addAll: ((nodes at: 5) at: 21) to: (result at: 20).
	self addAll: ((nodes at: 5) at: 22) to: (result at: 21).
	self addAll: ((nodes at: 5) at: 23) to: (result at: 22).
	self addAll: ((nodes at: 5) at: 24) to: (result at: 23).
	self addAll: ((nodes at: 5) at: 25) to: (result at: 36).
	self addAll: ((nodes at: 5) at: 26) to: (result at: 43).
	self addAll: ((nodes at: 5) at: 27) to: (result at: 33).
	self addAll: ((nodes at: 5) at: 28) to: (result at: 25).
	self addAll: ((nodes at: 5) at: 29) to: (result at: 26).
	self addAll: ((nodes at: 5) at: 30) to: (result at: 42).
	self addAll: ((nodes at: 5) at: 31) to: (result at: 35).
	self addAll: ((nodes at: 5) at: 32) to: (result at: 24).
	self addAll: ((nodes at: 5) at: 33) to: (result at: 27).
	self addAll: ((nodes at: 5) at: 34) to: (result at: 44).
	self addAll: ((nodes at: 5) at: 35) to: (result at: 45).
	self addAll: ((nodes at: 5) at: 36) to: (result at: 46).
	self addAll: ((nodes at: 5) at: 37) to: (result at: 47).
	self addAll: ((nodes at: 5) at: 38) to: (result at: 48).
	self addAll: ((nodes at: 5) at: 39) to: (result at: 49).
	self addAll: ((nodes at: 5) at: 40) to: (result at: 50).
	self addAll: ((nodes at: 5) at: 41) to: (result at: 51).
	self addAll: ((nodes at: 5) at: 42) to: (result at: 52).
	self addAll: ((nodes at: 5) at: 43) to: (result at: 53).
	self addAll: ((nodes at: 5) at: 44) to: (result at: 54).
	self addAll: ((nodes at: 5) at: 45) to: (result at: 55).
	self addAll: ((nodes at: 5) at: 46) to: (result at: 56).
	self addAll: ((nodes at: 5) at: 47) to: (result at: 57).
	self addAll: ((nodes at: 5) at: 48) to: (result at: 28).
	self addAll: ((nodes at: 5) at: 49) to: (result at: 29).
	self addAll: ((nodes at: 5) at: 50) to: (result at: 30).
	self addAll: ((nodes at: 5) at: 51) to: (result at: 31).
	self addAll: ((nodes at: 5) at: 52) to: (result at: 32).
	self addAll: ((nodes at: 5) at: 53) to: (result at: 34).
	self addAll: ((nodes at: 5) at: 54) to: (result at: 58).
	self addAll: ((nodes at: 5) at: 55) to: (result at: 59).
	self addAll: ((nodes at: 5) at: 56) to: (result at: 60).
	self addAll: ((nodes at: 5) at: 57) to: (result at: 61).
	self addAll: ((nodes at: 5) at: 58) to: (result at: 62).
	self addAll: ((nodes at: 5) at: 59) to: (result at: 63).
	self addAll: ((nodes at: 5) at: 60) to: (result at: 40).
	self addAll: ((nodes at: 5) at: 61) to: (result at: 64).
	self addAll: ((nodes at: 5) at: 62) to: (result at: 65).
	self addAll: ((nodes at: 5) at: 63) to: (result at: 66).
	self addAll: ((nodes at: 5) at: 64) to: (result at: 67).
	self addAll: ((nodes at: 5) at: 65) to: (result at: 39).
	self addAll: ((nodes at: 5) at: 66) to: (result at: 41).
	self addAll: ((nodes at: 5) at: 67) to: (result at: 68).
	self addAll: ((nodes at: 5) at: 68) to: (result at: 69).
	self add: ((nodes at: 5) at: 69) to: (result at: 70).
	self add: ((nodes at: 5) at: 70) to: (result at: 71).
	self addAll: ((nodes at: 5) at: 71) to: (result at: 72).
	self add: ((nodes at: 5) at: 72) to: (result at: 73).
	^ result