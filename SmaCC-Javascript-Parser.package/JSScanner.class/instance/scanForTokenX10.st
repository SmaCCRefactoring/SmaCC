generated
scanForTokenX10
	self recordMatch: #(10).
	self step.
	currentCharacter == $=
		ifTrue: [ self recordMatch: #(11).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(15) ] ].
	^ self reportLastMatch