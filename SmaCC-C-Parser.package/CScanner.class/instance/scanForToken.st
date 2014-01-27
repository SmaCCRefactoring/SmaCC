generated
scanForToken
	self step.
	currentCharacter == $' ifTrue: [^self scan1].
	currentCharacter == $-
		ifTrue:
			[self recordMatch: #(30).
			self step.
			currentCharacter == $- ifTrue: [^self recordAndReportMatch: #(19)].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(56)].
			currentCharacter == $> ifTrue: [^self recordAndReportMatch: #(21)].
			^self reportLastMatch].
	currentCharacter == $!
		ifTrue:
			[self recordMatch: #(28).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(2)].
			^self reportLastMatch].
	currentCharacter == $" ifTrue: [^self scan4].
	currentCharacter == $%
		ifTrue:
			[self recordMatch: #(17).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(33)].
			currentCharacter == $> ifTrue: [^self recordAndReportMatch: #(82)].
			^self reportLastMatch].
	currentCharacter == $&
		ifTrue:
			[self recordMatch: #(25).
			self step.
			currentCharacter == $& ifTrue: [^self recordAndReportMatch: #(7)].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(61)].
			^self reportLastMatch].
	currentCharacter == $( ifTrue: [^self recordAndReportMatch: #(24)].
	currentCharacter == $) ifTrue: [^self recordAndReportMatch: #(23)].
	currentCharacter == $*
		ifTrue:
			[self recordMatch: #(34).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(12)].
			^self reportLastMatch].
	currentCharacter == $, ifTrue: [^self recordAndReportMatch: #(26)].
	currentCharacter == $.
		ifTrue:
			[self recordMatch: #(22).
			self step.
			currentCharacter == $.
				ifTrue:
					[self step.
					currentCharacter == $. ifTrue: [^self recordAndReportMatch: #(74)].
					^self reportLastMatch].
			currentCharacter isDigit ifTrue: [^self scan5].
			^self reportLastMatch].
	currentCharacter == $/
		ifTrue:
			[self recordMatch: #(29).
			self step.
			currentCharacter == $* ifTrue: [^self scan8].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(11)].
			^self reportLastMatch].
	currentCharacter == $:
		ifTrue:
			[self recordMatch: #(14).
			self step.
			currentCharacter == $> ifTrue: [^self recordAndReportMatch: #(80)].
			^self reportLastMatch].
	currentCharacter == $; ifTrue: [^self recordAndReportMatch: #(58)].
	currentCharacter == $? ifTrue: [^self recordAndReportMatch: #(15)].
	currentCharacter == $[ ifTrue: [^self recordAndReportMatch: #(79)].
	currentCharacter == $] ifTrue: [^self recordAndReportMatch: #(80)].
	currentCharacter == $^
		ifTrue:
			[self recordMatch: #(1).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(60)].
			^self reportLastMatch].
	currentCharacter == ${ ifTrue: [^self recordAndReportMatch: #(81)].
	currentCharacter == $|
		ifTrue:
			[self recordMatch: #(8).
			self step.
			currentCharacter == $| ifTrue: [^self recordAndReportMatch: #(16)].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(59)].
			^self reportLastMatch].
	currentCharacter == $} ifTrue: [^self recordAndReportMatch: #(82)].
	currentCharacter == $~ ifTrue: [^self recordAndReportMatch: #(31)].
	currentCharacter == $+
		ifTrue:
			[self recordMatch: #(35).
			self step.
			currentCharacter == $+ ifTrue: [^self recordAndReportMatch: #(20)].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(18)].
			^self reportLastMatch].
	currentCharacter == $<
		ifTrue:
			[self recordMatch: #(10).
			self step.
			currentCharacter == $% ifTrue: [^self recordAndReportMatch: #(81)].
			currentCharacter == $: ifTrue: [^self recordAndReportMatch: #(79)].
			currentCharacter == $<
				ifTrue:
					[self recordMatch: #(27).
					self step.
					currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(36)].
					^self reportLastMatch].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(5)].
			^self reportLastMatch].
	currentCharacter == $=
		ifTrue:
			[self recordMatch: #(13).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(3)].
			^self reportLastMatch].
	currentCharacter == $>
		ifTrue:
			[self recordMatch: #(6).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(4)].
			currentCharacter == $>
				ifTrue:
					[self recordMatch: #(9).
					self step.
					currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(62)]].
			^self reportLastMatch].
	currentCharacter == $0
		ifTrue:
			[self recordMatch: #(77).
			self step.
			currentCharacter == $. ifTrue: [^self scan9].
			currentCharacter isDigit ifTrue: [^self scan10].
			('Ee' includes: currentCharacter) ifTrue: [^self scan6].
			('Xx' includes: currentCharacter)
				ifTrue:
					[self step.
					(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f])
						ifTrue:
							[[self recordMatch: #(77).
							self step.
							currentCharacter isHexDigit or: [currentCharacter between: $a and: $f]] whileTrue.
							('LUlu' includes: currentCharacter) ifTrue: [^self recordAndReportMatch: #(77)]].
					^self reportLastMatch].
			('LUlu' includes: currentCharacter) ifTrue: [^self recordAndReportMatch: #(77)].
			^self reportLastMatch].
	currentCharacter == $L
		ifTrue:
			[self recordMatch: #(76).
			self step.
			currentCharacter == $' ifTrue: [^self scan1].
			currentCharacter == $" ifTrue: [^self scan4].
			((currentCharacter between: $0 and: $9)
				or: [(currentCharacter between: $A and: $Z) or: [currentCharacter == $_ or: [currentCharacter between: $a and: $z]]])
				ifTrue:
					[[self recordMatch: #(76).
					self step.
					(currentCharacter between: $0 and: $9)
						or:
							[(currentCharacter between: $A and: $Z) or: [currentCharacter == $_ or: [currentCharacter between: $a and: $z]]]]
						whileTrue].
			^self reportLastMatch].
	currentCharacter isDigit ifTrue: [^self scan10].
	currentCharacter isWhitespace
		ifTrue:
			[[self recordMatch: #(83).
			self step.
			currentCharacter isWhitespace] whileTrue.
			^self reportLastMatch].
	((currentCharacter between: $A and: $K)
		or: [(currentCharacter between: $M and: $Z) or: [currentCharacter == $_ or: [currentCharacter between: $a and: $z]]])
		ifTrue:
			[[self recordMatch: #(76).
			self step.
			(currentCharacter between: $0 and: $9)
				or: [(currentCharacter between: $A and: $Z) or: [currentCharacter == $_ or: [currentCharacter between: $a and: $z]]]]
				whileTrue].
	^self reportLastMatch