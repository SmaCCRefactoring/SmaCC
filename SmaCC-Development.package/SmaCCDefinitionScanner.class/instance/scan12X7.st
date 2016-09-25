generated
scan12X7
	self recordMatch: #(33).
	self step.
	currentCharacter == $,
		ifTrue: [ ^ self scan15 ].
	currentCharacter isDigit
		ifTrue: [ [ self step.
			currentCharacter == $,
				ifTrue: [ ^ self scan15 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch