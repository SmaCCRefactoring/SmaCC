generated
scan9X6
	self recordMatch: #(32).
	self step.
	currentCharacter == $,
		ifTrue: [ ^ self scan12 ].
	(currentCharacter between: $0 and: $9)
		ifTrue: [ [ self step.
			currentCharacter == $,
				ifTrue: [ ^ self scan12 ].
			currentCharacter between: $0 and: $9 ] whileTrue ].
	^ self reportLastMatch