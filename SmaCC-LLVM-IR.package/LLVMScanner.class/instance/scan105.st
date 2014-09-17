generated
scan105
	self step.
	currentCharacter = $6
		ifTrue: [ ^ self scan106 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(170) ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch