generated-scanner
scanForToken
	self step.
	((currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #(99).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	(currentCharacter between: $1 and: $9)
		ifTrue: [ 
			[ 
			self recordMatch: #(93).
			self step.
			currentCharacter between: $0 and: $9 ] whileTrue.
			(currentCharacter = $D or: [ currentCharacter = $F or: [ currentCharacter = $d or: [ currentCharacter = $f ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(94) ].
			(currentCharacter = $E or: [ currentCharacter = $e ])
				ifTrue: [ ^ self scan2 ].
			(currentCharacter = $L or: [ currentCharacter = $l ])
				ifTrue: [ ^ self recordAndReportMatch: #(93) ].
			currentCharacter = $.
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	((currentCharacter between: Character tab and: Character cr) or: [ currentCharacter = Character space ])
		ifTrue: [ 
			[ 
			self recordMatch: #whitespace.
			self step.
			(currentCharacter between: Character tab and: Character cr) or: [ currentCharacter = Character space ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $!
		ifTrue: [ 
			self recordMatch: #(91).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(51) ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan5 ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(85).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(67) ].
			^ self reportLastMatch ].
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(50).
			self step.
			currentCharacter = $&
				ifTrue: [ ^ self recordAndReportMatch: #(52) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(61) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ 
			self step.
			(currentCharacter <= $& or: [ (currentCharacter between: $( and: $[) or: [ currentCharacter >= $] ] ])
				ifTrue: [ ^ self scan6 ].
			currentCharacter = $\
				ifTrue: [ 
					self step.
					(currentCharacter = $"
						or: [ 
							currentCharacter = $'
								or: [ 
									currentCharacter = $\
										or: [ 
											currentCharacter = $b
												or: [ currentCharacter = $f or: [ currentCharacter = $n or: [ currentCharacter = $r or: [ currentCharacter = $t ] ] ] ] ] ] ])
						ifTrue: [ ^ self scan6 ].
					(currentCharacter between: $0 and: $3)
						ifTrue: [ 
							self step.
							(currentCharacter between: $0 and: $7)
								ifTrue: [ ^ self scan7 ].
							currentCharacter = $'
								ifTrue: [ ^ self recordAndReportMatch: #(96) ].
							^ self reportLastMatch ].
					(currentCharacter between: $4 and: $7)
						ifTrue: [ ^ self scan7 ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(42).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(68) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(89).
			self step.
			currentCharacter = $+
				ifTrue: [ ^ self recordAndReportMatch: #(82) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(70) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(90).
			self step.
			currentCharacter = $-
				ifTrue: [ ^ self recordAndReportMatch: #(87) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(69) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(28).
			self step.
			(currentCharacter between: $0 and: $9)
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(88).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self recordAndReportMatch: #multipleLineComment ].
			currentCharacter = $/
				ifTrue: [ 
					[ 
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #comment ].
					currentCharacter = Character cr
						ifTrue: [ 
							self recordMatch: #comment.
							self step.
							currentCharacter = Character lf
								ifTrue: [ ^ self recordAndReportMatch: #comment ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(66) ].
			^ self reportLastMatch ].
	currentCharacter = $0
		ifTrue: [ 
			self recordMatch: #(93).
			self step.
			(currentCharacter between: $0 and: $7)
				ifTrue: [ 
					[ 
					self recordMatch: #(93).
					self step.
					currentCharacter between: $0 and: $7 ] whileTrue.
					(currentCharacter = $D or: [ currentCharacter = $F or: [ currentCharacter = $d or: [ currentCharacter = $f ] ] ])
						ifTrue: [ ^ self recordAndReportMatch: #(94) ].
					(currentCharacter between: $8 and: $9)
						ifTrue: [ ^ self scan3 ].
					(currentCharacter = $E or: [ currentCharacter = $e ])
						ifTrue: [ ^ self scan2 ].
					(currentCharacter = $L or: [ currentCharacter = $l ])
						ifTrue: [ ^ self recordAndReportMatch: #(93) ].
					currentCharacter = $.
						ifTrue: [ ^ self scan1 ].
					^ self reportLastMatch ].
			(currentCharacter = $D or: [ currentCharacter = $F or: [ currentCharacter = $d or: [ currentCharacter = $f ] ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(94) ].
			(currentCharacter between: $8 and: $9)
				ifTrue: [ ^ self scan3 ].
			(currentCharacter = $E or: [ currentCharacter = $e ])
				ifTrue: [ ^ self scan2 ].
			(currentCharacter = $L or: [ currentCharacter = $l ])
				ifTrue: [ ^ self recordAndReportMatch: #(93) ].
			(currentCharacter = $X or: [ currentCharacter = $x ])
				ifTrue: [ 
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(93).
							self step.
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ] ] whileTrue.
							(currentCharacter = $L or: [ currentCharacter = $l ])
								ifTrue: [ ^ self recordAndReportMatch: #(93) ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			currentCharacter = $.
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(15) ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(83).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(63) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(54) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(2).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(65) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(59).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(55) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(84).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(62) ].
					currentCharacter = $>
						ifTrue: [ 
							self recordMatch: #(86).
							self step.
							currentCharacter = $=
								ifTrue: [ ^ self recordAndReportMatch: #(60) ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(56) ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(48).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(64) ].
			^ self reportLastMatch ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(49).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(13) ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(53) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(92) ].
	^ self reportLastMatch