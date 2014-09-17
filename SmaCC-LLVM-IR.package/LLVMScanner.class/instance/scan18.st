generated
scan18
	[ 
	self recordMatch: #(162).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(170) ].
	currentCharacter isDigit ] whileTrue.
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch