generated
scan9X6
	self recordMatch: #(32).
	self step.
	currentCharacter == $,
		ifTrue: [ ^ self scan12 ].
	currentCharacter isDigit
		ifTrue: [ [ self step.
			currentCharacter == $,
				ifTrue: [ ^ self scan12 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch