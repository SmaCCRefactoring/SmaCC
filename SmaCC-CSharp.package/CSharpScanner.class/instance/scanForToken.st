generated
scanForToken
	self step.
	currentCharacter = $!
		ifTrue: [ 
			self recordMatch: #(9).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(33) ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $#
		ifTrue: [ 
			[ 
			self recordMatch: #(160).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(4).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(119) ].
			^ self reportLastMatch ].
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $&
				ifTrue: [ ^ self recordAndReportMatch: #(31) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(116) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ 
			self step.
			currentCharacter = $\
				ifTrue: [ 
					self step.
					currentCharacter = $x
						ifTrue: [ 
							self step.
							currentCharacter isHexDigit
								ifTrue: [ 
									3
										timesRepeat: [ 
											self step.
											currentCharacter = $'
												ifTrue: [ ^ self recordAndReportMatch: #(157) ].
											currentCharacter isHexDigit
												ifFalse: [ ^ self reportLastMatch ] ].
									^ self scan3 ].
							^ self reportLastMatch ].
					('Uu' includes: currentCharacter)
						ifTrue: [ 
							self step.
							currentCharacter isHexDigit
								ifTrue: [ 
									3
										timesRepeat: [ 
											self step.
											currentCharacter isHexDigit
												ifFalse: [ ^ self reportLastMatch ] ].
									self step.
									currentCharacter = $'
										ifTrue: [ ^ self recordAndReportMatch: #(157) ].
									currentCharacter isHexDigit
										ifTrue: [ 
											3
												timesRepeat: [ 
													self step.
													currentCharacter isHexDigit
														ifFalse: [ ^ self reportLastMatch ] ].
											^ self scan3 ] ].
							^ self reportLastMatch ].
					(('"''0\' includes: currentCharacter)
						or: [ (currentCharacter between: $a and: $b) or: [ 'fnrtv' includes: currentCharacter ] ])
						ifTrue: [ ^ self scan3 ].
					^ self reportLastMatch ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: $&)
						or: [ (currentCharacter between: $( and: $[) or: [ currentCharacter >= $] ] ] ])
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(65) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(2).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(129) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(16).
			self step.
			currentCharacter = $+
				ifTrue: [ ^ self recordAndReportMatch: #(37) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(131) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(15).
			self step.
			currentCharacter = $-
				ifTrue: [ ^ self recordAndReportMatch: #(19) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(130) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(98) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(48).
			self step.
			currentCharacter isDigit
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(1).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan7 ].
			currentCharacter = $/
				ifTrue: [ 
					[ 
					self recordMatch: #(153).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(123) ].
			^ self reportLastMatch ].
	currentCharacter = $0
		ifTrue: [ 
			self recordMatch: #(155 156).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan8 ].
			currentCharacter isDigit
				ifTrue: [ ^ self scan9 ].
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan5 ].
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self scan10 ].
			('Uu' includes: currentCharacter)
				ifTrue: [ ^ self scan11 ].
			('Xx' includes: currentCharacter)
				ifTrue: [ 
					self step.
					currentCharacter isHexDigit
						ifTrue: [ 
							[ 
							self recordMatch: #(155).
							self step.
							('Ll' includes: currentCharacter)
								ifTrue: [ ^ self scan10 ].
							('Uu' includes: currentCharacter)
								ifTrue: [ ^ self scan11 ].
							currentCharacter isHexDigit ] whileTrue ].
					^ self reportLastMatch ].
			('DFMdfm' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(156) ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(34).
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(40) ].
			^ self reportLastMatch ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(53) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(58).
			self step.
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(3).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(128) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(8) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(43).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(14) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(28) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(151).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(7) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(152).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(122) ] ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ 
			self recordMatch: #(74).
			self step.
			currentCharacter = $?
				ifTrue: [ ^ self recordAndReportMatch: #(35) ].
			^ self reportLastMatch ].
	currentCharacter = $@
		ifTrue: [ 
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan12 ].
			(currentCharacter isLetter or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(154).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $[
		ifTrue: [ ^ self recordAndReportMatch: #(66) ].
	currentCharacter = $]
		ifTrue: [ ^ self recordAndReportMatch: #(62) ].
	currentCharacter = $^
		ifTrue: [ 
			self recordMatch: #(29).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(118) ].
			^ self reportLastMatch ].
	currentCharacter = $`
		ifTrue: [ ^ self scan13 ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(51) ].
	currentCharacter = $|
		ifTrue: [ 
			self recordMatch: #(32).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(115) ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(36) ].
			^ self reportLastMatch ].
	currentCharacter = $}
		ifTrue: [ ^ self recordAndReportMatch: #(50) ].
	currentCharacter = $~
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan9 ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(160).
			self step.
			currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter isSafeForHTTP ])
		ifTrue: [ 
			[ 
			self recordMatch: #(154).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch