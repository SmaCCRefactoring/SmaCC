generated
scan11X6
	self recordMatch: #(32).
	self step.
	currentCharacter == $,
		ifTrue: [ ^ self scan14 ].
	currentCharacter isDigit
		ifTrue: [ [ self step.
			currentCharacter == $,
				ifTrue: [ ^ self scan14 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch