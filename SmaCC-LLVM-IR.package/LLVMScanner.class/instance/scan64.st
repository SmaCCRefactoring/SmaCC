generated
scan64
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(170) ].
	currentCharacter = $r
		ifTrue: [ ^ self scan65 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch