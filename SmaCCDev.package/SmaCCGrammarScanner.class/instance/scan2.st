generated-scanner
scan2
	[ 
	self step.
	currentCharacter ~= $" ] whileTrue.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(21).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	^ self reportLastMatch