accessing
runDeferredActionsFor: aSmaCCParser
	1 to: nodeStack size do:
		[ :i | 
		| each |
		each := nodeStack at: i.
		nodeStack at: i put: (each performOnSmaCCParser: aSmaCCParser) ]