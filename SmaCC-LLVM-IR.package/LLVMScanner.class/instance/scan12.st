generated
scan12
	self step.
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(249).
			self step.
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch