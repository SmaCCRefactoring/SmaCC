generated
scan10
	self step.
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(261).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan11 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch