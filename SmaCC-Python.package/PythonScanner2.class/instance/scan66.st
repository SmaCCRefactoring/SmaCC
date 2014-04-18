generated
scan66
	[ 
	self recordMatch: #(74).
	self step.
	currentCharacter = Character lf or: [ currentCharacter = Character cr ] ] whileTrue.
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ ^ self scan67 ].
	^ self reportLastMatch