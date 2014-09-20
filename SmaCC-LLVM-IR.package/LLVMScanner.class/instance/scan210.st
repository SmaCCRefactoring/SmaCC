generated
scan210
	self step.
	currentCharacter = $6
		ifTrue: [ ^ self scan211 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch