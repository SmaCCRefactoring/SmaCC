generated
scan1X5
	self recordMatch: #(64).
	self step.
	currentCharacter == $<
		ifTrue: [ self recordMatch: #(43).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(16) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(45) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(41) ].
	^ self reportLastMatch