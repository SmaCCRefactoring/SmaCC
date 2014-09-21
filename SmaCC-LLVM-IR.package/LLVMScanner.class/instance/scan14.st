generated
scan14
	self step.
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(261).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan15 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch