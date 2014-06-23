generated
scan13
	[ 
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self step.
			currentCharacter = $"
				ifTrue: [ 
					self step.
					currentCharacter = $"
						ifTrue: [ 
							self step.
							currentCharacter = Character cr
								ifTrue: [ ^ self scan14 ].
							((currentCharacter between: Character tab and: Character lf) or: [ currentCharacter = Character space ])
								ifTrue: [ ^ self scan11 ] ] ].
			^ self reportLastMatch ].
	currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
	^ self reportLastMatch