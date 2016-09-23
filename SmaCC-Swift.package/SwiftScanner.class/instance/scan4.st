generated
scan4
	[ self recordMatch: #(90).
	self step.
	currentCharacter == $*
		ifTrue: [ [ self recordMatch: #(90).
			self step.
			currentCharacter == $* ] whileTrue.
			currentCharacter == $/
				ifTrue: [ self recordMatch: #(85 90).
					self step.
					(currentCharacter == $!
						or: [ (currentCharacter between: $% and: $&)
								or: [ (currentCharacter between: $* and: $+)
										or: [ (currentCharacter between: $- and: $/)
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
																	[ '^|~' includes: currentCharacter ] ] ] ] ] ]
								whileTrue ].
					^ self reportLastMatch ].
			(currentCharacter == $!
				or: [ (currentCharacter between: $% and: $&)
						or: [ currentCharacter == $+
								or: [ (currentCharacter between: $- and: $.)
										or: [ (currentCharacter between: $< and: $>)
												or:
													[ '^|~' includes: currentCharacter ] ] ] ] ])
				ifTrue: [ ^ self scan4 ].
			^ self scan5 ].
	currentCharacter == $!
		or: [ (currentCharacter between: $% and: $&)
				or: [ currentCharacter == $+
						or: [ (currentCharacter between: $- and: $/)
								or: [ (currentCharacter between: $< and: $>)
										or:
											[ '^|~' includes: currentCharacter ] ] ] ] ] ] whileTrue.
	^ self scan5