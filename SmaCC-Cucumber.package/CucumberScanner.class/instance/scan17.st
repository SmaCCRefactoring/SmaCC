generated
scan17
	self step.
	currentCharacter = Character cr
		ifTrue: [ ^ self scan18 ].
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan17 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan19 ].
			^ self reportLastMatch ].
	((currentCharacter between: Character tab and: Character lf) or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan16 ].
	^ self reportLastMatch