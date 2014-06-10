generated
scan4
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan5 ].
	currentCharacter = Character cr
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character cr
				ifTrue: [ self step ].
			currentCharacter = Character lf
				ifTrue: [ ^ self scan6 ] ].
	^ self reportLastMatch