generated
scan29
	self recordMatch: #(36).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(116) ].
	currentCharacter == $|
		ifTrue: [ ^ self recordAndReportMatch: #(38) ].
	^ self reportLastMatch