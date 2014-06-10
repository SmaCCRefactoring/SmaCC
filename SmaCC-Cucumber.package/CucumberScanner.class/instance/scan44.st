generated
scan44
	self step.
	currentCharacter = $u
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ ^ self scan41 ] ].
	^ self reportLastMatch