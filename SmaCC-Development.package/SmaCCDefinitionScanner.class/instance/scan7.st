generated
scan7
	self recordMatch: #(34).
	self step.
	currentCharacter == $:
		ifTrue: [ self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(34) ] ].
	^ self reportLastMatch