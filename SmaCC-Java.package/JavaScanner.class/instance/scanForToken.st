generated
scanForToken
	self step.
	currentCharacter = $!
		ifTrue: [ 
			self recordMatch: #(94).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(71) ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(90).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(67) ].
			^ self reportLastMatch ].
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(53).
			self step.
			currentCharacter = $&
				ifTrue: [ ^ self recordAndReportMatch: #(50) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(61) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ 
			self step.
			currentCharacter = $\
				ifTrue: [ 
					self step.
					currentCharacter = $u
						ifTrue: [ 
							self step.
							currentCharacter isHexDigit
								ifTrue: [ 
									3
										timesRepeat: [ 
											self step.
											currentCharacter isHexDigit
												ifFalse: [ ^ self reportLastMatch ] ].
									^ self scan2 ].
							^ self reportLastMatch ].
					(currentCharacter between: $0 and: $3)
						ifTrue: [ 
							self step.
							currentCharacter = $'
								ifTrue: [ ^ self recordAndReportMatch: #(99) ].
							(currentCharacter between: $0 and: $7)
								ifTrue: [ ^ self scan3 ].
							^ self reportLastMatch ].
					(currentCharacter between: $4 and: $7)
						ifTrue: [ ^ self scan3 ].
					('"''\bfnrt' includes: currentCharacter)
						ifTrue: [ ^ self scan2 ].
					^ self reportLastMatch ].
			(currentCharacter <= $& or: [ (currentCharacter between: $( and: $[) or: [ currentCharacter >= $] ] ])
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(12) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(44).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(59) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(93).
			self step.
			currentCharacter = $+
				ifTrue: [ ^ self recordAndReportMatch: #(83) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(68) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(92).
			self step.
			currentCharacter = $-
				ifTrue: [ ^ self recordAndReportMatch: #(88) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(69) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(28).
			self step.
			currentCharacter isDigit
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(91).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan7 ].
			currentCharacter = $/
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(104) ].
					currentCharacter = Character cr
						ifTrue: [ 
							self recordMatch: #(104).
							self step.
							currentCharacter = Character lf
								ifTrue: [ ^ self recordAndReportMatch: #(104) ].
							^ self reportLastMatch ] ] repeat ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(60) ].
			^ self reportLastMatch ].
	currentCharacter = $0
		ifTrue: [ 
			self recordMatch: #(96).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan4 ].
			(currentCharacter between: $8 and: $9)
				ifTrue: [ ^ self scan8 ].
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(96).
					self step.
					currentCharacter = $.
						ifTrue: [ ^ self scan4 ].
					(currentCharacter between: $8 and: $9)
						ifTrue: [ ^ self scan8 ].
					currentCharacter isDigit ] whileTrue.
					('Ee' includes: currentCharacter)
						ifTrue: [ ^ self scan5 ].
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(96) ].
					('DFdf' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(97) ].
					^ self reportLastMatch ].
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan5 ].
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(96) ].
			('Xx' includes: currentCharacter)
				ifTrue: [ 
					self step.
					currentCharacter isHexDigit
						ifTrue: [ 
							[ 
							self recordMatch: #(96).
							self step.
							('Ll' includes: currentCharacter)
								ifTrue: [ ^ self recordAndReportMatch: #(96) ].
							currentCharacter isHexDigit ] whileTrue ].
					^ self reportLastMatch ].
			('DFdf' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(97) ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(18) ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(36) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(89).
			self step.
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(85).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(70) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(72) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(2).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(57) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(73).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(55) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(86).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(65) ].
					currentCharacter = $>
						ifTrue: [ 
							self recordMatch: #(87).
							self step.
							currentCharacter = $=
								ifTrue: [ ^ self recordAndReportMatch: #(66) ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(52) ].
	currentCharacter = $@
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(54).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(62) ].
			^ self reportLastMatch ].
	currentCharacter = $`
		ifTrue: [ ^ self scan9 ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(49).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(63) ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(51) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(95) ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(96).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan4 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan5 ].
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(96) ].
			('DFdf' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(97) ].
			^ self reportLastMatch ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(103).
			self step.
			currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(102).
			self step.
			currentCharacter = $$
				or: [ 
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ] ]
				whileTrue ].
	^ self reportLastMatch