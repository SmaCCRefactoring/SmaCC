generated
scan1X3
	self recordMatch: #(3).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan17 ].
	currentCharacter == $/
		ifTrue: [ [ self recordMatch: #(156).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage)
						or: [ currentCharacter >= (Character value: 14) ] ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter == $=
		ifTrue: [ ^ self recordAndReportMatch: #(124) ].
	^ self reportLastMatch