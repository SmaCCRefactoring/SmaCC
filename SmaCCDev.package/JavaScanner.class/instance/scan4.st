generated-scanner
scan4
	[ 
	self recordMatch: #(94).
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	(currentCharacter = $D or: [ currentCharacter = $F or: [ currentCharacter = $d or: [ currentCharacter = $f ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(94) ].
	^ self reportLastMatch