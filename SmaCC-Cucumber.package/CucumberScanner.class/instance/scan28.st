generated
scan28
	self step.
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(17).
			self step.
			currentCharacter = $!
				ifTrue: [ ^ self scan20 ] ].
	^ self reportLastMatch