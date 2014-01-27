generated
scanForToken
	self step.
	currentCharacter == $'
		ifTrue:
			[self recordMatch: #(32).
			self step.
			currentCharacter == $' ifTrue: [^self scan2].
			^self scan1].
	currentCharacter == $-
		ifTrue:
			[self recordMatch: #(26 32).
			self step.
			currentCharacter isDigit ifTrue: [^self recordAndReportMatch: #(22)].
			(currentCharacter == $!
				or:
					[(currentCharacter between: $% and: $&)
						or:
							[(currentCharacter between: $* and: $,)
								or: [currentCharacter == $/ or: [(currentCharacter between: $< and: $@) or: ['\|~' includes: currentCharacter]]]]])
				ifTrue: [^self recordAndReportMatch: #(26)].
			^self reportLastMatch].
	currentCharacter == $"
		ifTrue:
			[self recordMatch: #(32).
			self step.
			currentCharacter == $" ifTrue: [^self recordAndReportMatch: #(28)].
			true
				ifTrue:
					[[self step.
					currentCharacter == $" ifTrue: [^self recordAndReportMatch: #(28)]] repeat].
			^self reportLastMatch].
	currentCharacter == $# ifTrue: [^self recordAndReportMatch: #(2 32)].
	currentCharacter == $$
		ifTrue:
			[self recordMatch: #(32).
			self step.
			^self recordAndReportMatch: #(30)].
	currentCharacter == $( ifTrue: [^self recordAndReportMatch: #(3 32)].
	currentCharacter == $) ifTrue: [^self recordAndReportMatch: #(4 32)].
	currentCharacter == $. ifTrue: [^self recordAndReportMatch: #(5 32)].
	currentCharacter == $:
		ifTrue:
			[self recordMatch: #(19 32).
			self step.
			currentCharacter == $= ifTrue: [^self recordAndReportMatch: #(14)].
			^self reportLastMatch].
	currentCharacter == $; ifTrue: [^self recordAndReportMatch: #(6 32)].
	currentCharacter == $[ ifTrue: [^self recordAndReportMatch: #(18 32)].
	currentCharacter == $] ifTrue: [^self recordAndReportMatch: #(16 32)].
	currentCharacter == $^ ifTrue: [^self recordAndReportMatch: #(17 32)].
	currentCharacter == ${ ifTrue: [^self recordAndReportMatch: #(1 32)].
	currentCharacter == $|
		ifTrue:
			[self recordMatch: #(15 26 32).
			self step.
			(currentCharacter == $!
				or:
					[(currentCharacter between: $% and: $&)
						or:
							[(currentCharacter between: $* and: $,)
								or: [currentCharacter == $/ or: [(currentCharacter between: $< and: $@) or: ['\|~' includes: currentCharacter]]]]])
				ifTrue: [^self recordAndReportMatch: #(26)].
			^self reportLastMatch].
	currentCharacter == $} ifTrue: [^self recordAndReportMatch: #(9 32)].
	currentCharacter == $<
		ifTrue:
			[self recordMatch: #(7 26 32).
			self step.
			(currentCharacter == $!
				or:
					[(currentCharacter between: $% and: $&)
						or:
							[(currentCharacter between: $* and: $,)
								or: [currentCharacter == $/ or: [(currentCharacter between: $< and: $@) or: ['\|~' includes: currentCharacter]]]]])
				ifTrue: [^self recordAndReportMatch: #(26)].
			^self reportLastMatch].
	currentCharacter == $>
		ifTrue:
			[self recordMatch: #(8 26 32).
			self step.
			(currentCharacter == $!
				or:
					[(currentCharacter between: $% and: $&)
						or:
							[(currentCharacter between: $* and: $,)
								or: [currentCharacter == $/ or: [(currentCharacter between: $< and: $@) or: ['\|~' includes: currentCharacter]]]]])
				ifTrue: [^self recordAndReportMatch: #(26)].
			^self reportLastMatch].
	currentCharacter isDigit ifTrue: [^self recordAndReportMatch: #(21 32)].
	currentCharacter isWhitespace
		ifTrue:
			[self recordMatch: #(27 32).
			self step.
			currentCharacter isWhitespace
				ifTrue:
					[[self recordMatch: #(27).
					self step.
					currentCharacter isWhitespace] whileTrue].
			^self reportLastMatch].
	(currentCharacter == $!
		or:
			[(currentCharacter between: $% and: $&)
				or:
					[(currentCharacter between: $* and: $,)
						or:
							[('/=' includes: currentCharacter) or: [(currentCharacter between: $? and: $@) or: ['\~' includes: currentCharacter]]]]])
		ifTrue:
			[self recordMatch: #(26 32).
			self step.
			(currentCharacter == $!
				or:
					[(currentCharacter between: $% and: $&)
						or:
							[(currentCharacter between: $* and: $,)
								or: [currentCharacter == $/ or: [(currentCharacter between: $< and: $@) or: ['\|~' includes: currentCharacter]]]]])
				ifTrue: [^self recordAndReportMatch: #(26)].
			^self reportLastMatch].
	(currentCharacter <= ##(Character value: 8)
		or:
			[(currentCharacter between: ##(Character value: 14) and: ##(Character value: 31))
				or:
					[currentCharacter == $`
						or:
							[(currentCharacter between: ##(Character value: 127) and: ##(Character value: 130))
								or:
									[(currentCharacter between: ##(Character value: 132) and: ##(Character value: 137))
										or:
											[('ãç' includes: currentCharacter)
												or:
													[(currentCharacter between: ##(Character value: 143) and: ##(Character value: 153))
														or:
															[('õù' includes: currentCharacter)
																or:
																	[(currentCharacter between: ##(Character value: 160) and: ##(Character value: 169))
																		or:
																			[(currentCharacter between: ##(Character value: 171) and: ##(Character value: 180))
																				or:
																					[(currentCharacter between: ##(Character value: 182) and: ##(Character value: 185))
																						or:
																							[(currentCharacter between: ##(Character value: 187) and: ##(Character value: 191))
																								or: ['◊˜' includes: currentCharacter]]]]]]]]]]]]) ifTrue: [^self recordAndReportMatch: #(32)].
	true
		ifTrue:
			[self recordMatch: #(20 32).
			self step.
			currentCharacter == $. ifTrue: [^self scan3].
			currentCharacter == $: ifTrue: [^self scan4].
			(currentCharacter isLetter or: [currentCharacter isHexDigit or: [currentCharacter == $_]])
				ifTrue:
					[[self recordMatch: #(20).
					self step.
					currentCharacter == $. ifTrue: [^self scan3].
					currentCharacter == $: ifTrue: [^self scan4].
					currentCharacter isLetter or: [currentCharacter isHexDigit or: [currentCharacter == $_]]] whileTrue]].
	^self reportLastMatch