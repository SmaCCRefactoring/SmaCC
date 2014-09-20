generated
scan5
	[ 
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ] ] whileTrue.
	^ self reportLastMatch