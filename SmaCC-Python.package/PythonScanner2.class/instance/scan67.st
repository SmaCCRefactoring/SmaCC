generated
scan67
	[ 
	self step.
	(currentCharacter = Character lf or: [ currentCharacter = Character cr ])
		ifTrue: [ ^ self scan66 ].
	currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
	^ self reportLastMatch