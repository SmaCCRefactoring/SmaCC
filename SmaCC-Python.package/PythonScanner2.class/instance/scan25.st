generated
scan25
	self step.
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(79).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	('+-' includes: currentCharacter)
		ifTrue: [ 
			self step.
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(79).
					self step.
					currentCharacter isDigit ] whileTrue ] ].
	^ self reportLastMatch