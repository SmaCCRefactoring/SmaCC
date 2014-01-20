accessing
performOnSmaCCParser: aSmaCCParser
	^selector argumentCount = 0
		ifTrue: [aSmaCCParser perform: selector]
		ifFalse: [aSmaCCParser perform: selector with: (self argumentsFor: aSmaCCParser)]