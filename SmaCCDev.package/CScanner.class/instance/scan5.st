generated-scanner
scan5
	[ 
	self recordMatch: #(77).
	self step.
	currentCharacter between: $0 and: $9 ] whileTrue.
	(currentCharacter = $L or: [ currentCharacter = $U or: [ currentCharacter = $l or: [ currentCharacter = $u ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	(currentCharacter = $E or: [ currentCharacter = $e ])
		ifTrue: [ ^ self scan3 ].
	currentCharacter = $.
		ifTrue: [ ^ self scan2 ].
	^ self reportLastMatch