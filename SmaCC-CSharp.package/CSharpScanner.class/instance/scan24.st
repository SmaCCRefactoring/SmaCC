generated
scan24
	self recordMatch: #(57).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(30) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(24) ].
	^ self reportLastMatch