generated
scan3
	[ 
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(169) ].
	currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ] ] whileTrue.
	^ self reportLastMatch