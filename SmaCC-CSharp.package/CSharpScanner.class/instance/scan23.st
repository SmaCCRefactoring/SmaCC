generated
scan23
	self recordMatch: #(59).
	self step.
	currentCharacter == $<
		ifTrue: [ self recordMatch: #(7).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(118) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	^ self reportLastMatch