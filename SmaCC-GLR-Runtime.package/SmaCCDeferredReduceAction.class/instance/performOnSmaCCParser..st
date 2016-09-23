accessing
performOnSmaCCParser: aSmaCCParser
	^ selector numArgs = 0
		ifTrue: [ aSmaCCParser perform: selector ]
		ifFalse:
			[ aSmaCCParser
				perform: selector
				with: (self argumentsFor: aSmaCCParser) ]