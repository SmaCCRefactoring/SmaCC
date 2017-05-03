generated
scanForTokenX8
	self recordMatch: #(32).
	self step.
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(84) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(85) ].
	^ self reportLastMatch