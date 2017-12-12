generated
scanForTokenX6
	self recordMatch: #(36).
	self step.
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(20) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(37) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	^ self reportLastMatch