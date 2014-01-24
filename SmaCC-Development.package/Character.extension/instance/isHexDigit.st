*smacc-development
isHexDigit
	"Answer whether the receiver is one of the separator characters--space, 
	cr, tab, line feed, or form feed."

	self isDigit
		ifTrue: [ ^ true ].
	(value >= 97 and: [ value <= 102 ])
		ifTrue: [ ^ true ].
	(value >= 65 and: [ value <= 70 ])
		ifTrue: [ ^ true ].
	^ false