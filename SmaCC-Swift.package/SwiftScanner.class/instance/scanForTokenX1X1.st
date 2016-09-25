generated
scanForTokenX1X1
	[ self recordMatch: #(85 90).
	self step.
	currentCharacter == $!
		or: [ (currentCharacter between: $% and: $&)
				or: [ (currentCharacter between: $* and: $+)
						or: [ (currentCharacter between: $- and: $/)
								or: [ (currentCharacter between: $< and: $>)
										or:
											[ '^|~' includes: currentCharacter ] ] ] ] ] ] whileTrue.
	^ self scanForTokenX1X1X2