generated
scanForTokenX6
	self recordMatch: #(72).
	self step.
	currentCharacter == $<
		ifTrue: [ self recordMatch: #(75).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(70) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(60) ].
	^ self reportLastMatch