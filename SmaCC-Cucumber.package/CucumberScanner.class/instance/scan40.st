generated
scan40
	self step.
	currentCharacter = $n
		ifTrue: [ 
			self step.
			currentCharacter = $d
				ifTrue: [ ^ self scan41 ] ].
	^ self reportLastMatch