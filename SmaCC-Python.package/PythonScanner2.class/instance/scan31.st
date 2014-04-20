generated
scan31
	[ 
	self recordMatch: #(73).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan26 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan27 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	^ self reportLastMatch