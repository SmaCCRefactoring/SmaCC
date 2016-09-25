initialize-release
argumentsFor: aSmaCCParser
	1 to: arguments size do:
		[ :i | 
		arguments
			at: i
			put: ((arguments at: i) performOnSmaCCParser: aSmaCCParser) ].
	^ arguments