generated
scanForTokenX8
	self recordMatch: #(58).
	self step.
	currentCharacter == $<
		ifTrue: [ self recordMatch: #(3).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(117) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	^ self reportLastMatch