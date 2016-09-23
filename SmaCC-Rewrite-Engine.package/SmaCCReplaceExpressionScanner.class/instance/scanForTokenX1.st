generated
scanForTokenX1
	self step.
	currentCharacter == $\
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter == $_
		ifTrue: [ self recordMatch: #(1 4).
			self step.
			(currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ])
				ifTrue: [ [ self recordMatch: #(1).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter == $`
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	((currentCharacter between: $! and: $/)
		or: [ (currentCharacter between: $: and: $@)
				or: [ currentCharacter == $[
						or: [ (currentCharacter between: $] and: $^)
								or: [ currentCharacter between: ${ and: $~ ] ] ] ])
		ifTrue: [ [ self recordMatch: #(3).
			self step.
			(currentCharacter between: $! and: $/)
				or: [ (currentCharacter between: $: and: $@)
						or: [ currentCharacter == $[
								or: [ (currentCharacter between: $] and: $^)
										or: [ currentCharacter between: ${ and: $~ ] ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	currentCharacter isLetter
		ifTrue: [ [ self recordMatch: #(1).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter == $_ ] ]
				whileTrue ].
	^ self reportLastMatch