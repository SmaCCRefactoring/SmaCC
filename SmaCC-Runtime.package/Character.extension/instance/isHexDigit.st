*smacc-runtime
isHexDigit
	"Answer whether the receiver is one of the separator characters--space, 
	cr, tab, line feed, or form feed."

	self isDigit
		ifTrue: [ ^ true ].
	(self asciiValue >= 97 and: [ self asciiValue <= 102 ])
		ifTrue: [ ^ true ].
	(self asciiValue >= 65 and: [ self asciiValue <= 70 ])
		ifTrue: [ ^ true ].
	^ false