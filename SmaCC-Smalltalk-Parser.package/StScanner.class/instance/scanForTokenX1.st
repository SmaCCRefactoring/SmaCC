generated
scanForTokenX1
	self recordMatch: #(20 32).
	self step.
	currentCharacter == $.
		ifTrue: [ ^ self scan3 ].
	currentCharacter == $:
		ifTrue: [ ^ self scan4 ].
	(currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ])
		ifTrue: [ [ self recordMatch: #(20).
			self step.
			currentCharacter == $.
				ifTrue: [ ^ self scan3 ].
			currentCharacter == $:
				ifTrue: [ ^ self scan4 ].
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch