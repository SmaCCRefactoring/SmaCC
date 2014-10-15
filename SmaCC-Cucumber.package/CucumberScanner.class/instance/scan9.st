generated
scan9
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan10 ].
	currentCharacter = Character cr
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan10 ].
			^ self reportLastMatch ].
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character cr
				ifTrue: [ self step ].
			currentCharacter = Character lf
				ifTrue: [ ^ self scan11 ] ].
	^ self reportLastMatch