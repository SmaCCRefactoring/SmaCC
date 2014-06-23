generated
scan1
	self recordMatch: #(17).
	self step.
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan2 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan4 ] ].
	^ self reportLastMatch