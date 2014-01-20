generated-scanner
scan9
	self step.
	currentCharacter <= $ÿ
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch