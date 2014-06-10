generated
scan14
	[ 
	self step.
	currentCharacter = $#
		ifTrue: [ ^ self scan15 ].
	currentCharacter = $@
		ifTrue: [ ^ self scan16 ].
	currentCharacter = $B
		ifTrue: [ ^ self scan30 ].
	currentCharacter = $S
		ifTrue: [ ^ self scan32 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
	(currentCharacter <= Character backspace
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ 
							(currentCharacter between: $! and: $")
								or: [ 
									(currentCharacter between: $$ and: $?)
										or: [ 
											currentCharacter = $A
												or: [ (currentCharacter between: $C and: $R) or: [ (currentCharacter between: $T and: ${) or: [ currentCharacter >= $} ] ] ] ] ] ] ] ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch