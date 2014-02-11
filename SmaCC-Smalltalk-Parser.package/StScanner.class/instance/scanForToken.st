generated
scanForToken
	self step.
	currentCharacter = $"
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self recordAndReportMatch: #(28) ].
			true
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = $"
						ifTrue: [ ^ self recordAndReportMatch: #(28) ] ] repeat ].
			^ self reportLastMatch ].
	currentCharacter = $#
		ifTrue: [ ^ self recordAndReportMatch: #(1 32) ].
	currentCharacter = $$
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			^ self recordAndReportMatch: #(30) ].
	currentCharacter = $'
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			currentCharacter = $'
				ifTrue: [ ^ self scan2 ].
			^ self scan1 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(10 32) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(4 32) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(26 32).
			self step.
			currentCharacter isDigit
				ifTrue: [ ^ self recordAndReportMatch: #(22) ].
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ currentCharacter = $/ or: [ (currentCharacter between: $< and: $@) or: [ '\|~' includes: currentCharacter ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ ^ self recordAndReportMatch: #(5 32) ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(18 32).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(13) ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(2 32) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(6 26 32).
			self step.
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ currentCharacter = $/ or: [ (currentCharacter between: $< and: $@) or: [ '\|~' includes: currentCharacter ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(7 26 32).
			self step.
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ currentCharacter = $/ or: [ (currentCharacter between: $< and: $@) or: [ '\|~' includes: currentCharacter ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(17 32) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(19 32) ].
	currentCharacter = $^
		ifTrue: [ ^ self recordAndReportMatch: #(16 32) ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(3 32) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(9 26 32).
			self step.
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ currentCharacter = $/ or: [ (currentCharacter between: $< and: $@) or: [ '\|~' includes: currentCharacter ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(8 32) ].
	currentCharacter isDigit
		ifTrue: [ ^ self recordAndReportMatch: #(21 32) ].
	currentCharacter isSeparator
		ifTrue: [ 
			self recordMatch: #(27 32).
			self step.
			currentCharacter isSeparator
				ifTrue: [ 
					[ 
					self recordMatch: #(27).
					self step.
					currentCharacter isSeparator ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isSpecial
		ifTrue: [ 
			self recordMatch: #(26 32).
			self step.
			(currentCharacter = $!
				or: [ 
					(currentCharacter between: $% and: $&)
						or: [ 
							(currentCharacter between: $* and: $,)
								or: [ currentCharacter = $/ or: [ (currentCharacter between: $< and: $@) or: [ '\|~' includes: currentCharacter ] ] ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(26) ].
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter isSafeForHTTP ])
		ifTrue: [ 
			self recordMatch: #(20 32).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan3 ].
			currentCharacter = $:
				ifTrue: [ ^ self scan4 ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(20).
					self step.
					currentCharacter = $.
						ifTrue: [ ^ self scan3 ].
					currentCharacter = $:
						ifTrue: [ ^ self scan4 ].
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	^ self recordAndReportMatch: #(32)