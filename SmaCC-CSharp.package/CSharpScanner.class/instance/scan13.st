generated
scan13
	self recordMatch: #(9).
	self step.
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(131) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(99) ].
	^ self reportLastMatch