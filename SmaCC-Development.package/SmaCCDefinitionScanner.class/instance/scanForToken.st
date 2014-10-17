generated
scanForToken
	state == #parser
		ifTrue: [ ^ self scanSplit4 ].
	state == #directives
		ifTrue: [ 
			self step.
			currentCharacter = $"
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $#
				ifTrue: [ 
					[ 
					self recordMatch: #(32).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			currentCharacter = $%
				ifTrue: [ ^ self scan3 ].
			currentCharacter = $'
				ifTrue: [ ^ self scan4 ].
			currentCharacter = $(
				ifTrue: [ ^ self recordAndReportMatch: #(3) ].
			currentCharacter = $)
				ifTrue: [ ^ self recordAndReportMatch: #(8) ].
			currentCharacter = $*
				ifTrue: [ ^ self recordAndReportMatch: #(2) ].
			currentCharacter = $+
				ifTrue: [ ^ self recordAndReportMatch: #(1) ].
			currentCharacter = $/
				ifTrue: [ ^ self scan6 ].
			currentCharacter = $:
				ifTrue: [ ^ self scan8 ].
			currentCharacter = $;
				ifTrue: [ ^ self recordAndReportMatch: #(37) ].
			currentCharacter = $<
				ifTrue: [ ^ self scan10 ].
			currentCharacter = $?
				ifTrue: [ ^ self recordAndReportMatch: #(5) ].
			currentCharacter = $[
				ifTrue: [ ^ self recordAndReportMatch: #(7) ].
			currentCharacter = $]
				ifTrue: [ ^ self recordAndReportMatch: #(6) ].
			currentCharacter = $a
				ifTrue: [ ^ self scanSplit2 ].
			currentCharacter = $e
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $r
						ifTrue: [ ^ self scan13 ].
					currentCharacter = $x
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $c
								ifTrue: [ 
									self recordMatch: #(30).
									self step.
									currentCharacter = $l
										ifTrue: [ 
											self recordMatch: #(30).
											self step.
											currentCharacter = $u
												ifTrue: [ 
													self recordMatch: #(30).
													self step.
													currentCharacter = $d
														ifTrue: [ 
															self recordMatch: #(30).
															self step.
															currentCharacter = $e
																ifTrue: [ 
																	self recordMatch: #(30).
																	self step.
																	currentCharacter = $s
																		ifTrue: [ 
																			self recordMatch: #(13 30).
																			self step ] ] ] ] ] ] ].
					(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
						ifTrue: [ 
							[ 
							self recordMatch: #(30).
							self step.
							currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
					^ self reportLastMatch ].
			currentCharacter = $g
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $l
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self recordMatch: #(24 30).
									self step ] ].
					(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
						ifTrue: [ 
							[ 
							self recordMatch: #(30).
							self step.
							currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
					^ self reportLastMatch ].
			currentCharacter = $h
				ifTrue: [ ^ self scanSplit8 ].
			currentCharacter = $i
				ifTrue: [ ^ self scanSplit3 ].
			currentCharacter = $l
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $f
								ifTrue: [ 
									self recordMatch: #(30).
									self step.
									currentCharacter = $t
										ifTrue: [ 
											self recordMatch: #(19 30).
											self step ] ] ].
					(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
						ifTrue: [ 
							[ 
							self recordMatch: #(30).
							self step.
							currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
					^ self reportLastMatch ].
			currentCharacter = $n
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $o
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $n
								ifTrue: [ 
									self recordMatch: #(30).
									self step.
									currentCharacter = $a
										ifTrue: [ 
											2
												timesRepeat: [ 
													self recordMatch: #(30).
													self step.
													currentCharacter = $s
														ifFalse: [ ^ self reportLastMatch ] ].
											self recordMatch: #(30).
											self step.
											currentCharacter = $o
												ifTrue: [ 
													self recordMatch: #(30).
													self step.
													currentCharacter = $c
														ifTrue: [ 
															self recordMatch: #(21 30).
															self step ] ] ] ] ].
					(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
						ifTrue: [ 
							[ 
							self recordMatch: #(30).
							self step.
							currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
					^ self reportLastMatch ].
			currentCharacter = $p
				ifTrue: [ 
					self recordMatch: #(30).
					self step.
					currentCharacter = $r
						ifTrue: [ 
							self recordMatch: #(30).
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self recordMatch: #(30).
									self step.
									currentCharacter = $f
										ifTrue: [ 
											self recordMatch: #(30).
											self step.
											currentCharacter = $i
												ifTrue: [ 
													self recordMatch: #(30).
													self step.
													currentCharacter = $x
														ifTrue: [ 
															self recordMatch: #(17 30).
															self step ] ] ] ] ].
					(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
						ifTrue: [ 
							[ 
							self recordMatch: #(30).
							self step.
							currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
					^ self reportLastMatch ].
			currentCharacter = $r
				ifTrue: [ ^ self scanSplit7 ].
			currentCharacter = $s
				ifTrue: [ ^ self scanSplit6 ].
			currentCharacter = ${
				ifTrue: [ ^ self recordAndReportMatch: #(33) ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(4) ].
			(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
				ifTrue: [ 
					[ 
					self recordMatch: #(28).
					self step.
					currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
					^ self reportLastMatch ].
			(currentCharacter isLetter or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(30).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	state == #default
		ifTrue: [ ^ self scanSplit5 ].
	state == #scanner
		ifTrue: [ ^ self scanSplit1 ].
	^ self reportLastMatch