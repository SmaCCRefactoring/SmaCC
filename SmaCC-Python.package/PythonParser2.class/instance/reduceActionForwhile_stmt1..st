generated-reduction actions
reduceActionForwhile_stmt1: nodes
	| result |
	result := PyWhileNode new.
	result whileToken: (nodes at: 1).
	result addObjects: ((nodes at: 2) at: 1) to: result trailers.
	result addNode: ((nodes at: 2) at: 2) to: result ones.
	result addToken: ((nodes at: 2) at: 3) to: result orTokens.
	result addNode: ((nodes at: 2) at: 4) to: result twos.
	result addToken: ((nodes at: 2) at: 5) to: result ifTokens.
	result addNode: ((nodes at: 2) at: 6) to: result ifs.
	result addToken: ((nodes at: 2) at: 7) to: result elseTokens.
	result addObject: ((nodes at: 2) at: 8) to: result elses.
	result addToken: ((nodes at: 2) at: 9) to: result lambdaTokens.
	result addObject: ((nodes at: 2) at: 10) to: result argumentses.
	result addToken: ((nodes at: 2) at: 11) to: result colonTokens.
	result addObject: ((nodes at: 2) at: 12) to: result bodies.
	result addToken: (nodes at: 3) to: result colonTokens.
	result addObjects: ((nodes at: 4) at: 1) to: result tests.
	result addTokens: ((nodes at: 4) at: 2) to: result commaTokens.
	result addTokens: ((nodes at: 4) at: 3) to: result equalTokens.
	result addTokens: ((nodes at: 4) at: 4) to: result yieldTokens.
	result addObjects: ((nodes at: 4) at: 5) to: result argumentses.
	result plusEqualToken: ((nodes at: 4) at: 6).
	result minusEqualToken: ((nodes at: 4) at: 7).
	result timesEqualToken: ((nodes at: 4) at: 8).
	result divideEqualToken: ((nodes at: 4) at: 9).
	result percentEqualToken: ((nodes at: 4) at: 10).
	result andEqualToken: ((nodes at: 4) at: 11).
	result orEqualToken: ((nodes at: 4) at: 12).
	result upArrowEqualToken: ((nodes at: 4) at: 13).
	result lessThanLessThanEqualToken: ((nodes at: 4) at: 14).
	result greaterThanGreaterThanEqualToken: ((nodes at: 4) at: 15).
	result timesTimesEqualToken: ((nodes at: 4) at: 16).
	result divideDivideEqualToken: ((nodes at: 4) at: 17).
	result printToken: ((nodes at: 4) at: 18).
	result greaterThanGreaterThanToken: ((nodes at: 4) at: 19).
	result delToken: ((nodes at: 4) at: 20).
	result addObjects: ((nodes at: 4) at: 21) to: result trailers.
	result addNodes: ((nodes at: 4) at: 22) to: result ones.
	result addTokens: ((nodes at: 4) at: 23) to: result orTokens.
	result addNodes: ((nodes at: 4) at: 24) to: result twos.
	result passToken: ((nodes at: 4) at: 25).
	result breakToken: ((nodes at: 4) at: 26).
	result continueToken: ((nodes at: 4) at: 27).
	result returnToken: ((nodes at: 4) at: 28).
	result args: ((nodes at: 4) at: 29).
	result raiseToken: ((nodes at: 4) at: 30).
	result arg1: ((nodes at: 4) at: 31).
	result arg2: ((nodes at: 4) at: 32).
	result arg3: ((nodes at: 4) at: 33).
	result importToken: ((nodes at: 4) at: 34).
	result addObjects: ((nodes at: 4) at: 35) to: result names.
	result addTokens: ((nodes at: 4) at: 36) to: result asTokens.
	result addTokens: ((nodes at: 4) at: 37) to: result renames.
	result fromToken: ((nodes at: 4) at: 38).
	result from: ((nodes at: 4) at: 39).
	result timesToken: ((nodes at: 4) at: 40).
	result lparenToken: ((nodes at: 4) at: 41).
	result rparenToken: ((nodes at: 4) at: 42).
	result globalToken: ((nodes at: 4) at: 43).
	result addTokens: ((nodes at: 4) at: 44) to: result nameTokens.
	result execToken: ((nodes at: 4) at: 45).
	result inToken: ((nodes at: 4) at: 46).
	result addTokens: ((nodes at: 4) at: 47) to: result ifTokens.
	result addNodes: ((nodes at: 4) at: 48) to: result ifs.
	result addTokens: ((nodes at: 4) at: 49) to: result elseTokens.
	result addObjects: ((nodes at: 4) at: 50) to: result elses.
	result addTokens: ((nodes at: 4) at: 51) to: result lambdaTokens.
	result addTokens: ((nodes at: 4) at: 52) to: result colonTokens.
	result addObjects: ((nodes at: 4) at: 53) to: result bodies.
	result assertToken: ((nodes at: 4) at: 54).
	result condition: ((nodes at: 4) at: 55).
	result semicolonToken: ((nodes at: 4) at: 56).
	result simple: ((nodes at: 4) at: 57).
	result nEWLINEToken: ((nodes at: 4) at: 58).
	result iNDENTToken: ((nodes at: 4) at: 59).
	result addObjects: ((nodes at: 4) at: 60) to: result statements.
	result dEDENTToken: ((nodes at: 4) at: 61).
	result addVariablesFrom: (nodes at: 5).
	^ result