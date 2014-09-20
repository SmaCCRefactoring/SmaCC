generated
scan93
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	currentCharacter = $r
		ifTrue: [ ^ self scan94 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch