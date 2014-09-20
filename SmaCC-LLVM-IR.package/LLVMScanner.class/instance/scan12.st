generated
scan12
	self step.
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(250).
			self step.
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch