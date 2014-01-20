generated-scanner
scan3
	self step.
	(currentCharacter between: $0 and: $9)
		ifTrue: [ ^ self scan4 ].
	(currentCharacter = $+ or: [ currentCharacter = $- ])
		ifTrue: [ 
			self step.
			(currentCharacter between: $0 and: $9)
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	^ self reportLastMatch