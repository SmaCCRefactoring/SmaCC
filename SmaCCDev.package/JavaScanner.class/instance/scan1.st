generated-scanner
scan1
	[ 
	self recordMatch: #(94).
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	(currentCharacter = $D or: [ currentCharacter = $F or: [ currentCharacter = $d or: [ currentCharacter = $f ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(94) ].
	(currentCharacter = $E or: [ currentCharacter = $e ])
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch