generated
scan104
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(169) ].
	currentCharacter = $f
		ifTrue: [ ^ self scan105 ].
	currentCharacter = $s
		ifTrue: [ ^ self scan106 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch