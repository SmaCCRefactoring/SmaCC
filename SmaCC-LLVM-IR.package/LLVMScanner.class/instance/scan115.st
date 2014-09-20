generated
scan115
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	currentCharacter = $w
		ifTrue: [ ^ self scan116 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch