generated-reduction actions
reduceActionForsingle_input3: nodes
	| result |
	result := PySingleInputNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result ifTokens.
	result addObjects: ((nodes at: 1) at: 2) to: result ifs.
	result addTokens: ((nodes at: 1) at: 3) to: result colonTokens.
	result then: ((nodes at: 1) at: 4).
	result elsif: ((nodes at: 1) at: 5).
	result addObjects: ((nodes at: 1) at: 6) to: result elses.
	result whileToken: ((nodes at: 1) at: 7).
	result addObjects: ((nodes at: 1) at: 8) to: result trailers.
	result addNodes: ((nodes at: 1) at: 9) to: result ones.
	result addTokens: ((nodes at: 1) at: 10) to: result orTokens.
	result addNodes: ((nodes at: 1) at: 11) to: result twos.
	result addTokens: ((nodes at: 1) at: 12) to: result elseTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result lambdaTokens.
	result addObjects: ((nodes at: 1) at: 14) to: result argumentses.
	result addObjects: ((nodes at: 1) at: 15) to: result bodies.
	result addObjects: ((nodes at: 1) at: 16) to: result tests.
	result addTokens: ((nodes at: 1) at: 17) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result yieldTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result plusEqualTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result minusEqualTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result timesEqualTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result divideEqualTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result percentEqualTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result andEqualTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result orEqualTokens.
	result addTokens: ((nodes at: 1) at: 27) to: result upArrowEqualTokens.
	result addTokens: ((nodes at: 1) at: 28) to: result lessThanLessThanEqualTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result greaterThanGreaterThanEqualTokens.
	result addTokens: ((nodes at: 1) at: 30) to: result timesTimesEqualTokens.
	result addTokens: ((nodes at: 1) at: 31) to: result divideDivideEqualTokens.
	result addTokens: ((nodes at: 1) at: 32) to: result printTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result greaterThanGreaterThanTokens.
	result addTokens: ((nodes at: 1) at: 34) to: result delTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result passTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result breakTokens.
	result addTokens: ((nodes at: 1) at: 37) to: result continueTokens.
	result addTokens: ((nodes at: 1) at: 38) to: result returnTokens.
	result addObjects: ((nodes at: 1) at: 39) to: result argses.
	result addTokens: ((nodes at: 1) at: 40) to: result raiseTokens.
	result addObjects: ((nodes at: 1) at: 41) to: result arg1s.
	result addObjects: ((nodes at: 1) at: 42) to: result arg2s.
	result addObjects: ((nodes at: 1) at: 43) to: result arg3s.
	result addTokens: ((nodes at: 1) at: 44) to: result importTokens.
	result addObjects: ((nodes at: 1) at: 45) to: result names.
	result addTokens: ((nodes at: 1) at: 46) to: result asTokens.
	result addTokens: ((nodes at: 1) at: 47) to: result renames.
	result addTokens: ((nodes at: 1) at: 48) to: result fromTokens.
	result addObjects: ((nodes at: 1) at: 49) to: result froms.
	result addTokens: ((nodes at: 1) at: 50) to: result timesTokens.
	result addTokens: ((nodes at: 1) at: 51) to: result lparenTokens.
	result addTokens: ((nodes at: 1) at: 52) to: result rparenTokens.
	result addTokens: ((nodes at: 1) at: 53) to: result globalTokens.
	result addTokens: ((nodes at: 1) at: 54) to: result nameTokens.
	result addTokens: ((nodes at: 1) at: 55) to: result execTokens.
	result addTokens: ((nodes at: 1) at: 56) to: result inTokens.
	result addTokens: ((nodes at: 1) at: 57) to: result assertTokens.
	result addObjects: ((nodes at: 1) at: 58) to: result conditions.
	result addTokens: ((nodes at: 1) at: 59) to: result semicolonTokens.
	result addObjects: ((nodes at: 1) at: 60) to: result simples.
	result addTokens: ((nodes at: 1) at: 61) to: result nEWLINETokens.
	result addTokens: ((nodes at: 1) at: 62) to: result iNDENTTokens.
	result addObjects: ((nodes at: 1) at: 63) to: result statements.
	result addTokens: ((nodes at: 1) at: 64) to: result dEDENTTokens.
	result addTokens: ((nodes at: 1) at: 65) to: result forTokens.
	result tryToken: ((nodes at: 1) at: 66).
	result addTokens: ((nodes at: 1) at: 67) to: result exceptTokens.
	result finallyToken: ((nodes at: 1) at: 68).
	result withToken: ((nodes at: 1) at: 69).
	result defToken: ((nodes at: 1) at: 70).
	result fname: ((nodes at: 1) at: 71).
	result parameters: ((nodes at: 1) at: 72).
	result classToken: ((nodes at: 1) at: 73).
	result cname: ((nodes at: 1) at: 74).
	result addTokens: ((nodes at: 1) at: 75) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 76) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 77) to: result timesTimesTokens.
	result addToken: (nodes at: 2) to: result nEWLINETokens.
	^ result