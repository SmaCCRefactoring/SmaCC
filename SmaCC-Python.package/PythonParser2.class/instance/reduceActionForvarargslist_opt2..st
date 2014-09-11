generated-reduction actions
reduceActionForvarargslist_opt2: nodes
	| result |
	result := PyVarArgListNode new.
	result addTokens: ((nodes at: 1) at: 1) to: result args.
	result addNodes: ((nodes at: 1) at: 2) to: result inits.
	result addTokens: ((nodes at: 1) at: 3) to: result commaTokens.
	result timesToken: ((nodes at: 1) at: 4).
	result sname: ((nodes at: 1) at: 5).
	result timesTimesToken: ((nodes at: 1) at: 6).
	result ssname: ((nodes at: 1) at: 7).
	^ result