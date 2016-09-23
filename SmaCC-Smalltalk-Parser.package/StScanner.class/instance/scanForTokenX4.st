generated
scanForTokenX4
	self recordMatch: #(7 26 32).
	self step.
	(currentCharacter == $!
		or: [ (currentCharacter between: $% and: $&)
				or: [ (currentCharacter between: $* and: $,)
						or: [ currentCharacter == $/
								or: [ (currentCharacter between: $< and: $@)
										or:
											[ '\|~' includes: currentCharacter ] ] ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	^ self reportLastMatch