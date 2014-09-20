generated
scan159
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter = $t
		ifTrue: [ ^ self scan160 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch