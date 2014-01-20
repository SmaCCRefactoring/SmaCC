generated-scanner
scan1
	[ 
	self recordMatch: #(77).
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	(currentCharacter = $F or: [ currentCharacter = $L or: [ currentCharacter = $f or: [ currentCharacter = $l ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	(currentCharacter = $E or: [ currentCharacter = $e ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch