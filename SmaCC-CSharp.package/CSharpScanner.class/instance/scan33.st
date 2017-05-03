generated
scan33
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(163) ].
	currentCharacter == $\
		ifTrue:
			[ ^ self scan33X1 ].
	currentCharacter == ${
		ifTrue: [ self recordMatch: #(164).
			self step.
			currentCharacter == ${
				ifTrue: [ ^ self scan33 ].
			^ self reportLastMatch ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: $!)
				or: [ (currentCharacter between: $# and: $[)
						or: [ (currentCharacter between: $] and: $z)
								or: [ currentCharacter >= $| ] ] ] ] ] whileTrue.
	^ self reportLastMatch