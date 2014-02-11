generated
scan12
	self recordMatch: #(26).
	self step.
	currentCharacter = $r
		ifTrue: [ ^ self scan13 ].
	(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(26).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch