generated
scan45
	self step.
	currentCharacter = $i
		ifTrue: [ 
			self step.
			currentCharacter = $v
				ifTrue: [ ^ self scan46 ] ].
	^ self reportLastMatch