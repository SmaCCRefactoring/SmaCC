generated
scan4
	[ 
	self recordMatch: #(81).
	self step.
	currentCharacter = $\
		ifTrue: [ ^ self scan5 ].
	currentCharacter isAlphaNumeric or: [ '$_' includes: currentCharacter ] ] whileTrue.
	^ self reportLastMatch