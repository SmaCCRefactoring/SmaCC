generated-reduction actions
reduceActionFortest1: nodes
	| result |
	result := ASTTestOrTestNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result notTokens.
	result addTokens: ((nodes at: 1) at: 2) to: result upArrowTokens.
	result addTokens: ((nodes at: 1) at: 3) to: result orTokens.
	result addTokens: ((nodes at: 1) at: 4) to: result andTokens.
	result addTokens: ((nodes at: 1) at: 5) to: result lessThanTokens.
	result addTokens: ((nodes at: 1) at: 6) to: result greaterThanTokens.
	result addTokens: ((nodes at: 1) at: 7) to: result equalEqualTokens.
	result addTokens: ((nodes at: 1) at: 8) to: result greaterThanEqualTokens.
	result addTokens: ((nodes at: 1) at: 9) to: result lessThanEqualTokens.
	result addTokens: ((nodes at: 1) at: 10) to: result lessThanGreaterThanTokens.
	result addTokens: ((nodes at: 1) at: 11) to: result bangEqualTokens.
	result addTokens: ((nodes at: 1) at: 12) to: result inTokens.
	result addTokens: ((nodes at: 1) at: 13) to: result isTokens.
	result addTokens: ((nodes at: 1) at: 14) to: result plusTokens.
	result addTokens: ((nodes at: 1) at: 15) to: result minusTokens.
	result addTokens: ((nodes at: 1) at: 16) to: result lessThanLessThanTokens.
	result addTokens: ((nodes at: 1) at: 17) to: result greaterThanGreaterThanTokens.
	result addTokens: ((nodes at: 1) at: 18) to: result tildeTokens.
	result addTokens: ((nodes at: 1) at: 19) to: result timesTokens.
	result addTokens: ((nodes at: 1) at: 20) to: result divideTokens.
	result addTokens: ((nodes at: 1) at: 21) to: result percentTokens.
	result addTokens: ((nodes at: 1) at: 22) to: result divideDivideTokens.
	result addTokens: ((nodes at: 1) at: 23) to: result timesTimesTokens.
	result addTokens: ((nodes at: 1) at: 24) to: result lparenTokens.
	result addTokens: ((nodes at: 1) at: 25) to: result rparenTokens.
	result addTokens: ((nodes at: 1) at: 26) to: result yieldTokens.
	result addTokens: ((nodes at: 1) at: 27) to: result lbrackTokens.
	result addTokens: ((nodes at: 1) at: 28) to: result rbrackTokens.
	result addTokens: ((nodes at: 1) at: 29) to: result lcurlyTokens.
	result addTokens: ((nodes at: 1) at: 30) to: result rcurlyTokens.
	result addTokens: ((nodes at: 1) at: 31) to: result _Tokens.
	result addTokens: ((nodes at: 1) at: 32) to: result nameTokens.
	result addTokens: ((nodes at: 1) at: 33) to: result numberTokens.
	result addTokens: ((nodes at: 1) at: 34) to: result commaTokens.
	result addTokens: ((nodes at: 1) at: 35) to: result ifTokens.
	result addTokens: ((nodes at: 1) at: 36) to: result elseTokens.
	result addTokens: ((nodes at: 1) at: 37) to: result colonTokens.
	result addTokens: ((nodes at: 1) at: 38) to: result stringTokens.
	result addTokens: ((nodes at: 1) at: 39) to: result periodTokens.
	result addTokens: ((nodes at: 1) at: 40) to: result forTokens.
	result addTokens: ((nodes at: 1) at: 41) to: result equalTokens.
	result addTokens: ((nodes at: 1) at: 42) to: result lambdaTokens.
	^ result