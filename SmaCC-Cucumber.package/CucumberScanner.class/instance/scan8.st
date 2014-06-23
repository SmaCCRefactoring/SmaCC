generated
scan8
	[ 
	self step.
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ (currentCharacter between: (Character value: 14) and: ${) or: [ currentCharacter >= $} ] ] ] ] whileTrue.
	^ self reportLastMatch