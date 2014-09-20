generated
scan9
	self step.
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(247).
			self step.
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch