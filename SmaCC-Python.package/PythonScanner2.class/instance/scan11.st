generated
scan11
	[ 
	self recordMatch: #(78).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
		whileTrue.
	^ self reportLastMatch