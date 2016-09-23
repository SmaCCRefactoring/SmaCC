generated
scan11X5
	self recordMatch: #(24 37).
	self step.
	(currentCharacter isSeparator
		or: [ currentCharacter == Character pageUp ])
		ifTrue: [ [ self recordMatch: #(24).
			self step.
			currentCharacter isSeparator
				or: [ currentCharacter == Character pageUp ] ] whileTrue ].
	^ self reportLastMatch