generated
scan10
	self step.
	currentCharacter = Character cr
		ifTrue: [ ^ self scan11 ].
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan10 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan12 ].
			^ self reportLastMatch ].
	((currentCharacter between: Character tab and: Character lf) or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan9 ].
	^ self reportLastMatch