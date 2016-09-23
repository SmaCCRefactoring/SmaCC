generated
scanForTokenX1
	self recordMatch: #(90).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan4 ].
	currentCharacter == $/
		ifTrue:
			[ ^ self scanForTokenX1X1 ].
	(currentCharacter == $!
		or: [ (currentCharacter between: $% and: $&)
				or: [ currentCharacter == $+
						or: [ (currentCharacter between: $- and: $.)
								or: [ (currentCharacter between: $< and: $>)
										or:
											[ '^|~' includes: currentCharacter ] ] ] ] ])
		ifTrue: [ [ self recordMatch: #(90).
			self step.
			currentCharacter == $!
				or: [ (currentCharacter between: $% and: $&)
						or: [ (currentCharacter between: $* and: $+)
								or: [ (currentCharacter between: $- and: $/)
										or: [ (currentCharacter between: $< and: $>)
												or:
													[ '^|~' includes: currentCharacter ] ] ] ] ] ] whileTrue ].
	^ self reportLastMatch