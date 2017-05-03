generated
scanForTokenX3
	self recordMatch: #(49).
	self step.
	currentCharacter == $/
		ifTrue: [ [ self step.
			(currentCharacter == Character lf
				or: [ currentCharacter == Character cr ])
				ifTrue: [ ^ self recordAndReportMatch: #(140) ].
			true ] whileTrue ].
	^ self reportLastMatch