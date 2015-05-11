generated
scan21
	self step.
	currentCharacter = $c
		ifTrue: [ ^ self scan22 ].
	^ self reportLastMatch