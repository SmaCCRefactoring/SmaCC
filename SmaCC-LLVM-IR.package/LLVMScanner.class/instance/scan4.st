generated
scan4
	[ 
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(170) ].
	currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ] ] whileTrue.
	^ self reportLastMatch