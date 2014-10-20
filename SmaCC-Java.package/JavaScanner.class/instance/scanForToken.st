generated
scanForToken
	self step.
	currentCharacter = $!
		ifTrue: [ 
			self recordMatch: #(88).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(58) ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(89).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(67) ].
			^ self reportLastMatch ].
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(66).
			self step.
			currentCharacter = $&
				ifTrue: [ ^ self recordAndReportMatch: #(50) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(61) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ ^ self scanSplit2 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(44).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(57) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(93).
			self step.
			currentCharacter = $+
				ifTrue: [ ^ self recordAndReportMatch: #(92) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(68) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(90).
			self step.
			currentCharacter = $-
				ifTrue: [ ^ self recordAndReportMatch: #(94) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(71) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(85) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $.
				ifTrue: [ 
					self step.
					currentCharacter = $.
						ifTrue: [ ^ self recordAndReportMatch: #(20) ].
					^ self reportLastMatch ].
			currentCharacter isDigit
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(86).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan7 ].
			currentCharacter = $/
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(106) ].
					currentCharacter = Character cr
						ifTrue: [ 
							self recordMatch: #(106).
							self step.
							currentCharacter = Character lf
								ifTrue: [ ^ self recordAndReportMatch: #(106) ].
							^ self reportLastMatch ] ] repeat ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(69) ].
			^ self reportLastMatch ].
	currentCharacter = $0
		ifTrue: [ ^ self scanSplit1 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(45) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(72).
			self step.
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(76).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(70) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(60) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(2).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(59) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(95).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(55) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(96).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(64) ].
					currentCharacter = $>
						ifTrue: [ 
							self recordMatch: #(97).
							self step.
							currentCharacter = $=
								ifTrue: [ ^ self recordAndReportMatch: #(63) ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(54) ].
	currentCharacter = $@
		ifTrue: [ ^ self recordAndReportMatch: #(13) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(51).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(62) ].
			^ self reportLastMatch ].
	currentCharacter = $`
		ifTrue: [ ^ self scan9 ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(49).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(65) ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(53) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(87) ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(98).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan4 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan5 ].
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(98) ].
			('DFdf' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(99) ].
			^ self reportLastMatch ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(105).
			self step.
			currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(104).
			self step.
			currentCharacter = $$
				or: [ 
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
				whileTrue ].
	^ self reportLastMatch