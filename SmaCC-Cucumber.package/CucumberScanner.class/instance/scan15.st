generated
scan15
	self step.
	currentCharacter = Character cr
		ifTrue: [ ^ self scan16 ].
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan15 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan17 ].
			^ self reportLastMatch ].
	((currentCharacter between: Character tab and: Character lf) or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan14 ].
	^ self reportLastMatch