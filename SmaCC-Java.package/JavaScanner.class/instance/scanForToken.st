generated
scanForToken
	self step.
	currentCharacter == $'
		ifTrue:
			[self step.
			currentCharacter == $\
				ifTrue:
					[self step.
					currentCharacter == $u
						ifTrue:
							[self step.
							(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f])
								ifTrue:
									[3
										timesRepeat:
											[self step.
											(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f]) ifFalse: [^self reportLastMatch]].
									^self scan1].
							^self reportLastMatch].
					(currentCharacter between: $0 and: $3)
						ifTrue:
							[self step.
							currentCharacter == $' ifTrue: [^self recordAndReportMatch: #(99)].
							(currentCharacter between: $0 and: $7) ifTrue: [^self scan2].
							^self reportLastMatch].
					(currentCharacter between: $4 and: $7) ifTrue: [^self scan2].
					('"''\bfnrt' includes: currentCharacter) ifTrue: [^self scan1].
					^self reportLastMatch].
			(currentCharacter <= $& or: [(currentCharacter between: $( and: $[) or: [currentCharacter >= $]]])
				ifTrue: [^self scan1].
			^self reportLastMatch].
	currentCharacter == $-
		ifTrue:
			[self recordMatch: #(92).
			self step.
			currentCharacter == $- ifTrue: [^self recordAndReportMatch: #(95)].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(69)].
			^self reportLastMatch].
	currentCharacter == $!
		ifTrue:
			[self recordMatch: #(94).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(58)].
			^self reportLastMatch].
	currentCharacter == $" ifTrue: [^self scan3].
	currentCharacter == $%
		ifTrue:
			[self recordMatch: #(89).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(71)].
			^self reportLastMatch].
	currentCharacter == $&
		ifTrue:
			[self recordMatch: #(52).
			self step.
			currentCharacter == $& ifTrue: [^self recordAndReportMatch: #(50)].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(61)].
			^self reportLastMatch].
	currentCharacter == $( ifTrue: [^self recordAndReportMatch: #(23)].
	currentCharacter == $) ifTrue: [^self recordAndReportMatch: #(20)].
	currentCharacter == $*
		ifTrue:
			[self recordMatch: #(45).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(54)].
			^self reportLastMatch].
	currentCharacter == $, ifTrue: [^self recordAndReportMatch: #(5)].
	currentCharacter == $.
		ifTrue:
			[self recordMatch: #(30).
			self step.
			currentCharacter isDigit ifTrue: [^self scan4].
			^self reportLastMatch].
	currentCharacter == $/
		ifTrue:
			[self recordMatch: #(88).
			self step.
			currentCharacter == $* ifTrue: [^self scan7].
			currentCharacter == $/
				ifTrue:
					[[self step.
					currentCharacter isLinefeed ifTrue: [^self recordAndReportMatch: #(104)].
					currentCharacter == ##(Character value: 13)
						ifTrue:
							[self recordMatch: #(104).
							self step.
							currentCharacter isLinefeed ifTrue: [^self recordAndReportMatch: #(104)].
							^self reportLastMatch]] repeat].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(59)].
			^self reportLastMatch].
	currentCharacter == $: ifTrue: [^self recordAndReportMatch: #(13)].
	currentCharacter == $; ifTrue: [^self recordAndReportMatch: #(47)].
	currentCharacter == $? ifTrue: [^self recordAndReportMatch: #(55)].
	currentCharacter == $@ ifTrue: [^self recordAndReportMatch: #(48)].
	currentCharacter == $[ ifTrue: [^self recordAndReportMatch: #(7)].
	currentCharacter == $] ifTrue: [^self recordAndReportMatch: #(6)].
	currentCharacter == $^
		ifTrue:
			[self recordMatch: #(53).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(62)].
			^self reportLastMatch].
	currentCharacter == $` ifTrue: [^self scan8].
	currentCharacter == ${ ifTrue: [^self recordAndReportMatch: #(1)].
	currentCharacter == $|
		ifTrue:
			[self recordMatch: #(49).
			self step.
			currentCharacter == $| ifTrue: [^self recordAndReportMatch: #(51)].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(63)].
			^self reportLastMatch].
	currentCharacter == $} ifTrue: [^self recordAndReportMatch: #(2)].
	currentCharacter == $~ ifTrue: [^self recordAndReportMatch: #(93)].
	currentCharacter == $+
		ifTrue:
			[self recordMatch: #(91).
			self step.
			currentCharacter == $+ ifTrue: [^self recordAndReportMatch: #(83)].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(68)].
			^self reportLastMatch].
	currentCharacter == $<
		ifTrue:
			[self recordMatch: #(90).
			self step.
			currentCharacter == $<
				ifTrue:
					[self recordMatch: #(85).
					self step.
					currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(70)].
					^self reportLastMatch].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(60)].
			^self reportLastMatch].
	currentCharacter == $=
		ifTrue:
			[self recordMatch: #(3).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(57)].
			^self reportLastMatch].
	currentCharacter == $>
		ifTrue:
			[self recordMatch: #(66).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(67)].
			currentCharacter == $>
				ifTrue:
					[self recordMatch: #(86).
					self step.
					currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(64)].
					currentCharacter == $>
						ifTrue:
							[self recordMatch: #(87).
							self step.
							currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(65)]]].
			^self reportLastMatch].
	currentCharacter == $0
		ifTrue:
			[self recordMatch: #(96).
			self step.
			currentCharacter == $. ifTrue: [^self scan4].
			(currentCharacter between: $8 and: $9) ifTrue: [^self scan9].
			currentCharacter isDigit
				ifTrue:
					[[self recordMatch: #(96).
					self step.
					currentCharacter == $. ifTrue: [^self scan4].
					(currentCharacter between: $8 and: $9) ifTrue: [^self scan9].
					currentCharacter isDigit] whileTrue.
					('Ee' includes: currentCharacter) ifTrue: [^self scan5].
					('Ll' includes: currentCharacter) ifTrue: [^self recordAndReportMatch: #(96)].
					('DFdf' includes: currentCharacter) ifTrue: [^self recordAndReportMatch: #(97)].
					^self reportLastMatch].
			('Ee' includes: currentCharacter) ifTrue: [^self scan5].
			('Ll' includes: currentCharacter) ifTrue: [^self recordAndReportMatch: #(96)].
			('Xx' includes: currentCharacter)
				ifTrue:
					[self step.
					(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f])
						ifTrue:
							[[self recordMatch: #(96).
							self step.
							('Ll' includes: currentCharacter) ifTrue: [^self recordAndReportMatch: #(96)].
							currentCharacter isHexDigit or: [currentCharacter between: $a and: $f]] whileTrue].
					^self reportLastMatch].
			('DFdf' includes: currentCharacter) ifTrue: [^self recordAndReportMatch: #(97)].
			^self reportLastMatch].
	currentCharacter isDigit
		ifTrue:
			[[self recordMatch: #(96).
			self step.
			currentCharacter == $. ifTrue: [^self scan4].
			currentCharacter isDigit] whileTrue.
			('Ee' includes: currentCharacter) ifTrue: [^self scan5].
			('Ll' includes: currentCharacter) ifTrue: [^self recordAndReportMatch: #(96)].
			('DFdf' includes: currentCharacter) ifTrue: [^self recordAndReportMatch: #(97)].
			^self reportLastMatch].
	currentCharacter isWhitespace
		ifTrue:
			[[self recordMatch: #(103).
			self step.
			currentCharacter isWhitespace] whileTrue.
			^self reportLastMatch].
	(currentCharacter == $$
		or: [(currentCharacter between: $A and: $Z) or: [currentCharacter == $_ or: [currentCharacter between: $a and: $z]]])
		ifTrue:
			[[self recordMatch: #(102).
			self step.
			currentCharacter == $$
				or:
					[(currentCharacter between: $0 and: $9)
						or:
							[(currentCharacter between: $A and: $Z) or: [currentCharacter == $_ or: [currentCharacter between: $a and: $z]]]]]
				whileTrue].
	^self reportLastMatch