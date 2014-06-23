generated
scan20
	self recordMatch: #(4).
	self step.
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan20 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan21 ] ].
	^ self reportLastMatch