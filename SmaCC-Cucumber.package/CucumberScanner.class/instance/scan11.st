generated
scan11
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
								ifTrue: [ ^ self scan12 ].
							((currentCharacter between: Character tab and: Character lf) or: [ currentCharacter = Character space ])
								ifTrue: [ ^ self scan9 ] ] ].
			^ self reportLastMatch ].
	currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
	^ self reportLastMatch