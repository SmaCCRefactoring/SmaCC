generated
scan1
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	currentCharacter = Character cr
		ifTrue: [ 
			self recordMatch: #(80).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(80) ].
			^ self reportLastMatch ].
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(42) ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $#
		ifTrue: [ 
			[ 
			self recordMatch: #(78).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(51).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(31) ].
			^ self reportLastMatch ].
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(38).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(28) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(81) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(82) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(19).
			self step.
			currentCharacter = $*
				ifTrue: [ 
					self recordMatch: #(20).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(5) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(33) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(44).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(35) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(53).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(32) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(13).
			self step.
			currentCharacter isDigit
				ifTrue: [ ^ self scan10 ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(50).
			self step.
			currentCharacter = $/
				ifTrue: [ 
					self recordMatch: #(48).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(6) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(30) ].
			^ self reportLastMatch ].
	currentCharacter = $0
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(66).
			self step.
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(43).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(16) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(45) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(52) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(25).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(56) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(65).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(54) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(4).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(9) ] ].
			^ self reportLastMatch ].
	currentCharacter = $@
		ifTrue: [ ^ self recordAndReportMatch: #(23) ].
	currentCharacter = $R
		ifTrue: [ ^ self scan15 ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(83) ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(79) ].
			currentCharacter = Character cr
				ifTrue: [ 
					self recordMatch: #(79).
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(79) ] ].
			^ self reportLastMatch ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(84) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(37).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(34) ].
			^ self reportLastMatch ].
	currentCharacter = $`
		ifTrue: [ ^ self recordAndReportMatch: #(46) ].
	currentCharacter = $a
		ifTrue: [ ^ self scan16 ].
	currentCharacter = $b
		ifTrue: [ ^ self scan17 ].
	currentCharacter = $c
		ifTrue: [ ^ self scan18 ].
	currentCharacter = $d
		ifTrue: [ ^ self scan19 ].
	currentCharacter = $e
		ifTrue: [ ^ self scan20 ].
	currentCharacter = $f
		ifTrue: [ ^ self scan21 ].
	currentCharacter = $g
		ifTrue: [ ^ self scan22 ].
	currentCharacter = $i
		ifTrue: [ ^ self scan23 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan24 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan25 ].
	currentCharacter = $o
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $r
				ifTrue: [ 
					self recordMatch: #(68 71).
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(71).
							self step.
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
								whileTrue ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $p
		ifTrue: [ ^ self scan26 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan27 ].
	currentCharacter = $t
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $r
				ifTrue: [ 
					self recordMatch: #(71).
					self step.
					currentCharacter = $y
						ifTrue: [ 
							self recordMatch: #(62 71).
							self step.
							((currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
								ifTrue: [ 
									[ 
									self recordMatch: #(71).
									self step.
									(currentCharacter between: $0 and: $9)
										or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
										whileTrue ].
							^ self reportLastMatch ].
					((currentCharacter between: $0 and: $9)
						or: [ 
							(currentCharacter between: $A and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $x) or: [ currentCharacter = $z ] ] ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(71).
							self step.
							(currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
								whileTrue ].
					^ self reportLastMatch ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Z)
						or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $w
		ifTrue: [ ^ self scan28 ].
	currentCharacter = $y
		ifTrue: [ ^ self scan29 ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(85) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(40).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(29) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(86) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(49) ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(73).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan10 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan11 ].
			('Ljl' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(73) ].
			^ self reportLastMatch ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ 
			[ 
			self recordMatch: #(79).
			self step.
			currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
			^ self reportLastMatch ].
	('BUu' includes: currentCharacter)
		ifTrue: [ 
			self recordMatch: #(71).
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan2 ].
			currentCharacter = $'
				ifTrue: [ ^ self scan6 ].
			('Rr' includes: currentCharacter)
				ifTrue: [ ^ self scan15 ].
			((currentCharacter between: $0 and: $9)
				or: [ 
					(currentCharacter between: $A and: $Q)
						or: [ 
							(currentCharacter between: $S and: $Z)
								or: [ currentCharacter = $_ or: [ (currentCharacter between: $a and: $q) or: [ currentCharacter between: $s and: $z ] ] ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(71).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue ].
			^ self reportLastMatch ].
	currentCharacter isSafeForHTTP
		ifTrue: [ 
			[ 
			self recordMatch: #(71).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
				whileTrue ].
	^ self reportLastMatch