generated
scan28
	self step.
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(73).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	('+-' includes: currentCharacter)
		ifTrue: [ 
			self step.
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(73).
					self step.
					currentCharacter isDigit ] whileTrue ] ].
	^ self reportLastMatch