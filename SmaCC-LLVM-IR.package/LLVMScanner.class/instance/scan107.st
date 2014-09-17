generated
scan107
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(170) ].
	currentCharacter = $f
		ifTrue: [ ^ self scan108 ].
	currentCharacter = $s
		ifTrue: [ ^ self scan109 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch