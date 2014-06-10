generated
scan21
	self step.
	currentCharacter = Character cr
		ifTrue: [ ^ self scan26 ].
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan21 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan27 ].
			^ self reportLastMatch ].
	((currentCharacter between: Character tab and: Character lf) or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan20 ].
	^ self reportLastMatch