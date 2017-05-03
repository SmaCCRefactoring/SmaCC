generated
scanForTokenX1
	self step.
	currentCharacter == $!
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $%
		ifTrue: [ ^ self scan8 ].
	currentCharacter == $&
		ifTrue: [ ^ self scan9 ].
	currentCharacter == $(
		ifTrue: [ ^ self recordAndReportMatch: #(65) ].
	^ self scanForTokenX1X3