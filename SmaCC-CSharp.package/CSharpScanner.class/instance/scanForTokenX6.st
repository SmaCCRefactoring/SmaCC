generated
scanForTokenX6
	self recordMatch: #(15).
	self step.
	currentCharacter == $-
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(130) ].
	currentCharacter == $>
		ifTrue: [ ^ self recordAndReportMatch: #(98) ].
	^ self reportLastMatch