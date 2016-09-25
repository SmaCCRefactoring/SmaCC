generated
scan13
	[ self recordMatch: #(88).
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self scan14 ].
	currentCharacter isAlphaNumeric
		or: [ '$_' includes: currentCharacter ] ] whileTrue.
	^ self reportLastMatch