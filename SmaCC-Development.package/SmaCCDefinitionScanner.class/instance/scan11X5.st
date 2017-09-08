generated
scan11X5
	self recordMatch: #(27 40).
	self step.
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue: [ [ self recordMatch: #(27).
			self step.
			currentCharacter isSeparator
				or: [ currentCharacter == Character pageUp ] ] whileTrue ].
	^ self reportLastMatch