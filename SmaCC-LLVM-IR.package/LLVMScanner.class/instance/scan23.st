generated
scan23
	[ 
	self recordMatch: #(265).
	self step.
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
		whileTrue.
	^ self reportLastMatch