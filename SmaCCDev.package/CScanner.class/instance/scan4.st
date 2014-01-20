generated-scanner
scan4
	[ 
	self recordMatch: #(77).
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	(currentCharacter = $F or: [ currentCharacter = $L or: [ currentCharacter = $f or: [ currentCharacter = $l ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	^ self reportLastMatch