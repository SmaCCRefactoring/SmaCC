generated
scan9
	self step.
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = $.
				ifTrue: [ 
					[ 
					self recordMatch: #(168).
					self step.
					currentCharacter isDigit ] whileTrue.
					('Ee' includes: currentCharacter)
						ifTrue: [ 
							self step.
							currentCharacter isDigit
								ifTrue: [ 
									[ 
									self recordMatch: #(168).
									self step.
									currentCharacter isDigit ] whileTrue.
									^ self reportLastMatch ].
							('+-' includes: currentCharacter)
								ifTrue: [ ^ self scan10 ] ].
					^ self reportLastMatch ].
			currentCharacter isDigit ] whileTrue ].
	^ self reportLastMatch