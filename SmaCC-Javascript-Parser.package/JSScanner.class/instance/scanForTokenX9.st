generated
scanForTokenX9
	self recordMatch: #(63).
	self step.
	currentCharacter == $=
		ifTrue: [ self recordMatch: #(13).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(38) ] ].
	^ self reportLastMatch