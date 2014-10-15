generated
scan18
	self recordMatch: #(4).
	self step.
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan18 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan19 ] ].
	^ self reportLastMatch