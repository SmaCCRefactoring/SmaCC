generated
scan8
	self recordMatch: #(25).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan5 ].
	currentCharacter == $0
		ifTrue:
			[ ^ self scan8X10 ].
	^ self scan8X12