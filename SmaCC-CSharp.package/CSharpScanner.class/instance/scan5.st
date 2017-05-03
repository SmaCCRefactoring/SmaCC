generated
scan5
	[ self step.
	currentCharacter == $"
		ifTrue: [ ^ self recordAndReportMatch: #(161) ].
	currentCharacter == $\
		ifTrue:
			[ ^ self scan5X1 ].
	currentCharacter == ${
		ifTrue: [ self recordMatch: #(162).
			self step.
			currentCharacter == ${
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: $!)
				or: [ (currentCharacter between: $# and: $[)
						or: [ (currentCharacter between: $] and: $z)
								or: [ currentCharacter >= $| ] ] ] ] ] whileTrue.
	^ self reportLastMatch