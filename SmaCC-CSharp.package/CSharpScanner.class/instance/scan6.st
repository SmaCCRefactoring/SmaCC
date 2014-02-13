generated
scan6
	[ 
	self recordMatch: #(156).
	self step.
	currentCharacter isDigit ] whileTrue.
	('DFMdfm' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(156) ].
	^ self reportLastMatch