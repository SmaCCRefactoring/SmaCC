generated
scan13
	[ 
	self recordMatch: #(85).
	self step.
	currentCharacter = $\
		ifTrue: [ ^ self scan14 ].
	currentCharacter isAlphaNumeric or: [ '$_' includes: currentCharacter ] ] whileTrue.
	^ self reportLastMatch