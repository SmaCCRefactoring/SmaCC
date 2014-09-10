generated-reduction actions
reduceActionForfor_stmt1: nodes
	| result |
	result := PyForNode new.
	result forToken: (nodes at: 1).
	result addObjects: ((nodes at: 2) at: 1) to: result trailers.
	result addNodes: ((nodes at: 2) at: 2) to: result ones.
	result addTokens: ((nodes at: 2) at: 3) to: result orTokens.
	result addNodes: ((nodes at: 2) at: 4) to: result twos.
	result addTokens: ((nodes at: 2) at: 5) to: result commaTokens.
	result addToken: (nodes at: 3) to: result inTokens.
	result addObjects: ((nodes at: 4) at: 1) to: result tests.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result addToken: (nodes at: 5) to: result colonTokens.
	result addObjects: ((nodes at: 6) at: 1) to: result tests.
	result addTokens: ((nodes at: 6) at: 2) to: result commaTokens.
	result addTokens: ((nodes at: 6) at: 3) to: result equalTokens.
	result addTokens: ((nodes at: 6) at: 4) to: result yieldTokens.
	result addObjects: ((nodes at: 6) at: 5) to: result argumentses.
	result plusEqualToken: ((nodes at: 6) at: 6).
	result minusEqualToken: ((nodes at: 6) at: 7).
	result timesEqualToken: ((nodes at: 6) at: 8).
	result divideEqualToken: ((nodes at: 6) at: 9).
	result percentEqualToken: ((nodes at: 6) at: 10).
	result andEqualToken: ((nodes at: 6) at: 11).
	result orEqualToken: ((nodes at: 6) at: 12).
	result upArrowEqualToken: ((nodes at: 6) at: 13).
	result lessThanLessThanEqualToken: ((nodes at: 6) at: 14).
	result greaterThanGreaterThanEqualToken: ((nodes at: 6) at: 15).
	result timesTimesEqualToken: ((nodes at: 6) at: 16).
	result divideDivideEqualToken: ((nodes at: 6) at: 17).
	result printToken: ((nodes at: 6) at: 18).
	result greaterThanGreaterThanToken: ((nodes at: 6) at: 19).
	result delToken: ((nodes at: 6) at: 20).
	result addObjects: ((nodes at: 6) at: 21) to: result trailers.
	result addNodes: ((nodes at: 6) at: 22) to: result ones.
	result addTokens: ((nodes at: 6) at: 23) to: result orTokens.
	result addNodes: ((nodes at: 6) at: 24) to: result twos.
	result passToken: ((nodes at: 6) at: 25).
	result breakToken: ((nodes at: 6) at: 26).
	result continueToken: ((nodes at: 6) at: 27).
	result returnToken: ((nodes at: 6) at: 28).
	result args: ((nodes at: 6) at: 29).
	result raiseToken: ((nodes at: 6) at: 30).
	result arg1: ((nodes at: 6) at: 31).
	result arg2: ((nodes at: 6) at: 32).
	result arg3: ((nodes at: 6) at: 33).
	result importToken: ((nodes at: 6) at: 34).
	result addObjects: ((nodes at: 6) at: 35) to: result names.
	result addTokens: ((nodes at: 6) at: 36) to: result asTokens.
	result addTokens: ((nodes at: 6) at: 37) to: result renames.
	result fromToken: ((nodes at: 6) at: 38).
	result from: ((nodes at: 6) at: 39).
	result timesToken: ((nodes at: 6) at: 40).
	result lparenToken: ((nodes at: 6) at: 41).
	result rparenToken: ((nodes at: 6) at: 42).
	result globalToken: ((nodes at: 6) at: 43).
	result addTokens: ((nodes at: 6) at: 44) to: result nameTokens.
	result execToken: ((nodes at: 6) at: 45).
	result addToken: ((nodes at: 6) at: 46) to: result inTokens.
	result addTokens: ((nodes at: 6) at: 47) to: result ifTokens.
	result addNodes: ((nodes at: 6) at: 48) to: result ifs.
	result addTokens: ((nodes at: 6) at: 49) to: result elseTokens.
	result addObjects: ((nodes at: 6) at: 50) to: result elses.
	result addTokens: ((nodes at: 6) at: 51) to: result lambdaTokens.
	result addTokens: ((nodes at: 6) at: 52) to: result colonTokens.
	result addObjects: ((nodes at: 6) at: 53) to: result bodies.
	result assertToken: ((nodes at: 6) at: 54).
	result condition: ((nodes at: 6) at: 55).
	result semicolonToken: ((nodes at: 6) at: 56).
	result simple: ((nodes at: 6) at: 57).
	result nEWLINEToken: ((nodes at: 6) at: 58).
	result iNDENTToken: ((nodes at: 6) at: 59).
	result addObjects: ((nodes at: 6) at: 60) to: result statements.
	result dEDENTToken: ((nodes at: 6) at: 61).
	result addVariablesFrom: (nodes at: 7).
	^ result