generated
scan33
	self recordMatch: #(33).
	self step.
	currentCharacter = $,
		ifTrue: [ ^ self scan34 ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = $,
				ifTrue: [ ^ self scan34 ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch