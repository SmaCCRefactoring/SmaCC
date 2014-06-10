generated
scan42
	self recordMatch: #(16).
	self step.
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan34 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan43 ] ].
	^ self reportLastMatch