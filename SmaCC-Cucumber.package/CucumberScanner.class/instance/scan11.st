generated
scan11
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan12 ].
	currentCharacter = Character cr
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan12 ].
			^ self reportLastMatch ].
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character cr
				ifTrue: [ self step ].
			currentCharacter = Character lf
				ifTrue: [ ^ self scan13 ] ].
	^ self reportLastMatch