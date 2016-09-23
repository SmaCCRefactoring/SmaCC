generated
scanForTokenX9
	self recordMatch: #(27 32).
	self step.
	currentCharacter isSeparator
		ifTrue: [ [ self recordMatch: #(27).
			self step.
			currentCharacter isSeparator ] whileTrue ].
	^ self reportLastMatch