generated-scanner
scan3
	[ 
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	(currentCharacter = $D or: [ currentCharacter = $F or: [ currentCharacter = $d or: [ currentCharacter = $f ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(94) ].
	(currentCharacter = $E or: [ currentCharacter = $e ])
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $.
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch