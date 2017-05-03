generated
scan1
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(23).
			self step.
			currentCharacter == $#
				ifTrue: [ ^ self scan1 ].
			currentCharacter == $'
				ifTrue: [ ^ self scan2 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch