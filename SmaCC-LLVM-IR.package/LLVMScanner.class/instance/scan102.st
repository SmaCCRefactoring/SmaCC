generated
scan102
	self step.
	currentCharacter = $6
		ifTrue: [ ^ self scan103 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(169) ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch