generated
scanForTokenX5
	self recordMatch: #(6 26 32).
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