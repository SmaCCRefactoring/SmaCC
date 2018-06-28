generated
scan7
	self recordMatch: #(35).
	self step.
	currentCharacter == $:
		ifTrue: [ self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(35) ] ].
	^ self reportLastMatch