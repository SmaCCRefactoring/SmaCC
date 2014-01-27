generated
scanForToken
	self step.
	currentCharacter == $'
		ifTrue:
			[self step.
			currentCharacter == $\
				ifTrue:
					[self step.
					currentCharacter == $x
						ifTrue:
							[self step.
							(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f])
								ifTrue:
									[3
										timesRepeat:
											[self step.
											currentCharacter == $' ifTrue: [^self recordAndReportMatch: #(157)].
											(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f]) ifFalse: [^self reportLastMatch]].
									^self scan1].
							^self reportLastMatch].
					('Uu' includes: currentCharacter)
						ifTrue:
							[self step.
							(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f])
								ifTrue:
									[3
										timesRepeat:
											[self step.
											(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f]) ifFalse: [^self reportLastMatch]].
									self step.
									currentCharacter == $' ifTrue: [^self recordAndReportMatch: #(157)].
									(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f])
										ifTrue:
											[3
												timesRepeat:
													[self step.
													(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f]) ifFalse: [^self reportLastMatch]].
											^self scan1]].
							^self reportLastMatch].
					(('"''0\' includes: currentCharacter)
						or: [(currentCharacter between: $a and: $b) or: ['fnrtv' includes: currentCharacter]]) ifTrue: [^self scan1].
					^self reportLastMatch].
			(currentCharacter <= ##(Character value: 9)
				or:
					[(currentCharacter between: ##(Character value: 11) and: $&)
						or: [(currentCharacter between: $( and: $[) or: [currentCharacter >= $]]]]) ifTrue: [^self scan1].
			^self reportLastMatch].
	currentCharacter == $-
		ifTrue:
			[self recordMatch: #(7).
			self step.
			currentCharacter == $- ifTrue: [^self recordAndReportMatch: #(34)].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(130)].
			currentCharacter == $> ifTrue: [^self recordAndReportMatch: #(99)].
			^self reportLastMatch].
	currentCharacter == $!
		ifTrue:
			[self recordMatch: #(14).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(37)].
			^self reportLastMatch].
	currentCharacter == $" ifTrue: [^self scan2].
	currentCharacter == $#
		ifTrue:
			[[self recordMatch: #(160).
			self step.
			currentCharacter <= ##(Character value: 9)
				or:
					[(currentCharacter between: ##(Character value: 11) and: ##(Character value: 12))
						or: [currentCharacter >= ##(Character value: 14)]]] whileTrue.
			^self reportLastMatch].
	currentCharacter == $%
		ifTrue:
			[self recordMatch: #(3).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(122)].
			^self reportLastMatch].
	currentCharacter == $&
		ifTrue:
			[self recordMatch: #(30).
			self step.
			currentCharacter == $& ifTrue: [^self recordAndReportMatch: #(31)].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(115)].
			^self reportLastMatch].
	currentCharacter == $( ifTrue: [^self recordAndReportMatch: #(62)].
	currentCharacter == $) ifTrue: [^self recordAndReportMatch: #(63)].
	currentCharacter == $*
		ifTrue:
			[self recordMatch: #(1).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(121)].
			^self reportLastMatch].
	currentCharacter == $, ifTrue: [^self recordAndReportMatch: #(58)].
	currentCharacter == $.
		ifTrue:
			[self recordMatch: #(48).
			self step.
			currentCharacter isDigit ifTrue: [^self scan4].
			^self reportLastMatch].
	currentCharacter == $/
		ifTrue:
			[self recordMatch: #(2).
			self step.
			currentCharacter == $* ifTrue: [^self scan7].
			currentCharacter == $/
				ifTrue:
					[[self recordMatch: #(153).
					self step.
					currentCharacter <= ##(Character value: 9)
						or:
							[(currentCharacter between: ##(Character value: 11) and: ##(Character value: 12))
								or: [currentCharacter >= ##(Character value: 14)]]] whileTrue.
					^self reportLastMatch].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(128)].
			^self reportLastMatch].
	currentCharacter == $:
		ifTrue:
			[self recordMatch: #(26).
			self step.
			currentCharacter == $: ifTrue: [^self recordAndReportMatch: #(39)].
			^self reportLastMatch].
	currentCharacter == $; ifTrue: [^self recordAndReportMatch: #(45)].
	currentCharacter == $?
		ifTrue:
			[self recordMatch: #(74).
			self step.
			currentCharacter == $? ifTrue: [^self recordAndReportMatch: #(35)].
			^self reportLastMatch].
	currentCharacter == $@
		ifTrue:
			[self step.
			currentCharacter == $" ifTrue: [^self scan8].
			(currentCharacter isLetter or: [currentCharacter == $_])
				ifTrue:
					[[self recordMatch: #(154).
					self step.
					currentCharacter isLetter or: [currentCharacter isHexDigit or: [currentCharacter == $_]]] whileTrue].
			^self reportLastMatch].
	currentCharacter == $[ ifTrue: [^self recordAndReportMatch: #(71)].
	currentCharacter == $] ifTrue: [^self recordAndReportMatch: #(65)].
	currentCharacter == $^
		ifTrue:
			[self recordMatch: #(29).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(117)].
			^self reportLastMatch].
	currentCharacter == $` ifTrue: [^self scan9].
	currentCharacter == ${ ifTrue: [^self recordAndReportMatch: #(51)].
	currentCharacter == $|
		ifTrue:
			[self recordMatch: #(32).
			self step.
			currentCharacter == $| ifTrue: [^self recordAndReportMatch: #(36)].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(116)].
			^self reportLastMatch].
	currentCharacter == $} ifTrue: [^self recordAndReportMatch: #(50)].
	currentCharacter == $~ ifTrue: [^self recordAndReportMatch: #(8)].
	currentCharacter == $+
		ifTrue:
			[self recordMatch: #(16).
			self step.
			currentCharacter == $+ ifTrue: [^self recordAndReportMatch: #(19)].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(131)].
			^self reportLastMatch].
	currentCharacter == $<
		ifTrue:
			[self recordMatch: #(59).
			self step.
			currentCharacter == $<
				ifTrue:
					[self recordMatch: #(4).
					self step.
					currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(118)].
					^self reportLastMatch].
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(5)].
			^self reportLastMatch].
	currentCharacter == $=
		ifTrue:
			[self recordMatch: #(46).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(18)].
			currentCharacter == $> ifTrue: [^self recordAndReportMatch: #(33)].
			^self reportLastMatch].
	currentCharacter == $>
		ifTrue:
			[self recordMatch: #(151).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(6)].
			currentCharacter == $>
				ifTrue:
					[self recordMatch: #(152).
					self step.
					currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(132)]].
			^self reportLastMatch].
	currentCharacter == $0
		ifTrue:
			[self recordMatch: #(155 156).
			self step.
			currentCharacter == $. ifTrue: [^self scan10].
			currentCharacter isDigit ifTrue: [^self scan11].
			('Ee' includes: currentCharacter) ifTrue: [^self scan5].
			('Ll' includes: currentCharacter) ifTrue: [^self scan12].
			('Uu' includes: currentCharacter) ifTrue: [^self scan13].
			('Xx' includes: currentCharacter)
				ifTrue:
					[self step.
					(currentCharacter isHexDigit or: [currentCharacter between: $a and: $f])
						ifTrue:
							[[self recordMatch: #(155).
							self step.
							('Ll' includes: currentCharacter) ifTrue: [^self scan12].
							('Uu' includes: currentCharacter) ifTrue: [^self scan13].
							currentCharacter isHexDigit or: [currentCharacter between: $a and: $f]] whileTrue].
					^self reportLastMatch].
			('DFMdfm' includes: currentCharacter) ifTrue: [^self recordAndReportMatch: #(156)].
			^self reportLastMatch].
	currentCharacter isDigit ifTrue: [^self scan11].
	currentCharacter isWhitespace
		ifTrue:
			[[self recordMatch: #(160).
			self step.
			currentCharacter isWhitespace] whileTrue.
			^self reportLastMatch].
	(currentCharacter isLetter or: [currentCharacter == $_])
		ifTrue:
			[[self recordMatch: #(154).
			self step.
			currentCharacter isLetter or: [currentCharacter isHexDigit or: [currentCharacter == $_]]] whileTrue].
	^self reportLastMatch