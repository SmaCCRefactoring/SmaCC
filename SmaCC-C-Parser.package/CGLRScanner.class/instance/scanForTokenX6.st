generated
scanForTokenX6
	self recordMatch: #(6).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(8) ].
	currentCharacter == $>
		ifTrue: [ self recordMatch: #(14).
			self step.
			currentCharacter == $=
				ifTrue: [ ^ self recordAndReportMatch: #(62) ] ].
	^ self reportLastMatch