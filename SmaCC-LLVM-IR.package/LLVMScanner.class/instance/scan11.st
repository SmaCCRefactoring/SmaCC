generated
scan11
	[ 
	self recordMatch: #(249).
	self step.
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ 
			self step.
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(249).
					self step.
					currentCharacter isDigit ] whileTrue.
					^ self reportLastMatch ].
			('+-' includes: currentCharacter)
				ifTrue: [ ^ self scan12 ] ].
	^ self reportLastMatch