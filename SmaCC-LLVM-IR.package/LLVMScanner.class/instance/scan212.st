generated
scan212
	self step.
	currentCharacter = $4
		ifTrue: [ ^ self scan213 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch