generated
scan6
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $n
				ifTrue: [ ^ self scan5 ] ].
	^ self reportLastMatch