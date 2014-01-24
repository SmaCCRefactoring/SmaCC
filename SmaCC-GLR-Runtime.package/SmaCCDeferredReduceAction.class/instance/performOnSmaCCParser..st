accessing
performOnSmaCCParser: aSmaCCParser
	^ selector isUnary
		ifTrue: [ aSmaCCParser perform: selector ]
		ifFalse: [ aSmaCCParser perform: selector with: (self argumentsFor: aSmaCCParser) ]