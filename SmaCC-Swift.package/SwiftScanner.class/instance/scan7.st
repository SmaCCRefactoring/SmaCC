generated
scan7
	self step.
	currentCharacter isDigit
		ifTrue: [ [ self recordMatch: #(88).
			self step.
			currentCharacter isDigit or: [ currentCharacter == $_ ] ] whileTrue.
			^ self reportLastMatch ].
	('+-' includes: currentCharacter)
		ifTrue: [ self step.
			currentCharacter isDigit
				ifTrue: [ [ self recordMatch: #(88).
					self step.
					currentCharacter isDigit or: [ currentCharacter == $_ ] ]
						whileTrue ] ].
	^ self reportLastMatch