generated
scanForTokenX3
	self recordMatch: #(18).
	self step.
	currentCharacter == $%
		ifTrue: [ ^ self recordAndReportMatch: #(81) ].
	currentCharacter == $:
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	currentCharacter == $<
		ifTrue: [ self recordMatch: #(33).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(45) ].
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
	^ self reportLastMatch