generated
scan46
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $n
				ifTrue: [ ^ self scan41 ] ].
	^ self reportLastMatch