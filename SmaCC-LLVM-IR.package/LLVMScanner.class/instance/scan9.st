generated
scan9
	self step.
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(167).
			self step.
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch