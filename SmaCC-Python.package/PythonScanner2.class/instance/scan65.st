generated
scan65
	[ 
	self recordMatch: #(75).
	self step.
	(currentCharacter between: Character pageUp and: Character newPage)
		ifTrue: [ ^ self scan67 ].
	currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
	currentCharacter isSeparator
		ifTrue: [ ^ self scan66 ].
	^ self reportLastMatch