generated-scanner
scanForToken
	self step.
	(currentCharacter <= Character backspace
		or: [ 
			currentCharacter = Character newPage
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ 
							(currentCharacter between: $! and: $")
								or: [ 
									currentCharacter = $$
										or: [ 
											(currentCharacter between: $& and: $')
												or: [ 
													(currentCharacter between: $, and: $-)
														or: [ 
															(currentCharacter between: $0 and: $9)
																or: [ 
																	(currentCharacter between: $= and: $>)
																		or: [ 
																			currentCharacter = $@
																				or: [ (currentCharacter between: $] and: $^) or: [ currentCharacter = $` or: [ currentCharacter >= $} ] ] ] ] ] ] ] ] ] ] ] ])
		ifTrue: [ ^ self recordAndReportMatch: #(18) ].
	((currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ])
		ifTrue: [ 
			self recordMatch: #(17 18).
			self step.
			((currentCharacter between: $0 and: $9)
				or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #(17).
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	((currentCharacter between: Character tab and: Character pageUp)
		or: [ currentCharacter = Character cr or: [ currentCharacter = Character space ] ])
		ifTrue: [ 
			[ 
			self recordMatch: #whitespace.
			self step.
			(currentCharacter between: Character tab and: Character pageUp)
				or: [ currentCharacter = Character cr or: [ currentCharacter = Character space ] ] ] whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $#
		ifTrue: [ 
			self recordMatch: #comment.
			self step.
			(currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ])
				ifTrue: [ 
					[ 
					self recordMatch: #comment.
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(18).
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self step.
					currentCharacter = $x
						ifTrue: [ 
							self step.
							currentCharacter = $c
								ifTrue: [ 
									self step.
									currentCharacter = $l
										ifTrue: [ 
											self step.
											currentCharacter = $u
												ifTrue: [ 
													self step.
													currentCharacter = $d
														ifTrue: [ 
															self step.
															currentCharacter = $e
																ifTrue: [ 
																	self step.
																	currentCharacter = $s
																		ifTrue: [ ^ self recordAndReportMatch: #(7) ].
																	^ self reportLastMatch ].
															^ self reportLastMatch ].
													^ self reportLastMatch ].
											^ self reportLastMatch ].
									^ self reportLastMatch ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			currentCharacter = $s
				ifTrue: [ 
					self step.
					currentCharacter = $t
						ifTrue: [ 
							self step.
							currentCharacter = $a
								ifTrue: [ 
									self step.
									currentCharacter = $t
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ 
													self step.
													currentCharacter = $s
														ifTrue: [ ^ self recordAndReportMatch: #(8) ].
													^ self reportLastMatch ].
											^ self reportLastMatch ].
									^ self reportLastMatch ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(1 18) ].
	currentCharacter = $*
		ifTrue: [ ^ self recordAndReportMatch: #(4 18) ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(3 18) ].
	currentCharacter = $.
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(18).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(10 18) ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(9 18) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(18).
			self step.
			((currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ])
				ifTrue: [ 
					[ 
					self step.
					(currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $Z) or: [ currentCharacter = $_ or: [ currentCharacter between: $a and: $z ] ] ] ]
						whileTrue.
					currentCharacter = $>
						ifTrue: [ ^ self recordAndReportMatch: #(14) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(6 18) ].
	currentCharacter = $[
		ifTrue: [ 
			self step.
			(currentCharacter <= $[ or: [ currentCharacter >= $^ ])
				ifTrue: [ ^ self scan3 ].
			currentCharacter = $\
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	currentCharacter = $\
		ifTrue: [ 
			self step.
			(currentCharacter <= $b or: [ (currentCharacter between: $d and: $w) or: [ currentCharacter >= $y ] ])
				ifTrue: [ ^ self recordAndReportMatch: #(11) ].
			currentCharacter = $c
				ifTrue: [ 
					self step.
					(currentCharacter between: $A and: $Z)
						ifTrue: [ ^ self recordAndReportMatch: #(11) ].
					^ self reportLastMatch ].
			currentCharacter = $x
				ifTrue: [ 
					self step.
					((currentCharacter between: $0 and: $9)
						or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ 
							self recordMatch: #(11).
							self step.
							((currentCharacter between: $0 and: $9)
								or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ 
									self recordMatch: #(11).
									self step.
									((currentCharacter between: $0 and: $9)
										or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ])
										ifTrue: [ 
											self recordMatch: #(11).
											self step.
											((currentCharacter between: $0 and: $9)
												or: [ (currentCharacter between: $A and: $F) or: [ currentCharacter between: $a and: $f ] ])
												ifTrue: [ ^ self recordAndReportMatch: #(11) ].
											^ self reportLastMatch ].
									^ self reportLastMatch ].
							^ self reportLastMatch ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = ${
		ifTrue: [ 
			[ 
			self step.
			currentCharacter between: $0 and: $9 ] whileTrue.
			currentCharacter = $,
				ifTrue: [ 
					[ 
					self step.
					currentCharacter between: $0 and: $9 ] whileTrue.
					currentCharacter = $}
						ifTrue: [ ^ self recordAndReportMatch: #(16) ].
					^ self reportLastMatch ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(5 18) ].
	^ self reportLastMatch