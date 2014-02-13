generated
scan9
	[ 
	self recordMatch: #(155 156).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan8 ].
	currentCharacter isDigit ] whileTrue.
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self scan10 ].
	('Uu' includes: currentCharacter)
		ifTrue: [ ^ self scan11 ].
	('DFMdfm' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(156) ].
	^ self reportLastMatch