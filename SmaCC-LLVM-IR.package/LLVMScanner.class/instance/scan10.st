generated
scan10
	self step.
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(168).
			self step.
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch