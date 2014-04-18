generated
scan27
	[ 
	self recordMatch: #(79).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan24 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan25 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	^ self reportLastMatch