generated
scan1X7
	self recordMatch: #(67).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(54) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(4).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(9) ] ].
	^ self reportLastMatch