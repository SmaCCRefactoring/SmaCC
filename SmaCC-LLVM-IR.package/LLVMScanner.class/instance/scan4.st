generated
scan4
	self step.
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(261).
			self step.
			currentCharacter isDigit ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(261).
			self step.
			currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ] ] whileTrue ].
	^ self reportLastMatch