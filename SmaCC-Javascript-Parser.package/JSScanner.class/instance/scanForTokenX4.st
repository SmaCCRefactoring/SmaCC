generated
scanForTokenX4
	self recordMatch: #(9).
	self step.
	currentCharacter == $<
		ifTrue: [ self recordMatch: #(1).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(72) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(16) ].
	^ self reportLastMatch