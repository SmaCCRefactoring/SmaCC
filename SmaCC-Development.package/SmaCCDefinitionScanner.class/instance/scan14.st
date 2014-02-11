generated
scan14
	self step.
	currentCharacter = $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $#
		ifTrue: [ 
			[ 
			self recordMatch: #(28).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ ^ self recordAndReportMatch: #(32) ].
	currentCharacter = $'
		ifTrue: [ ^ self scan4 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(1) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(5) ].
	currentCharacter = $*
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
	currentCharacter = $+
		ifTrue: [ ^ self recordAndReportMatch: #(3) ].
	currentCharacter = $/
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $:
		ifTrue: [ ^ self scan8 ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(33) ].
	currentCharacter = $<
		ifTrue: [ ^ self scan10 ].
	currentCharacter = $?
		ifTrue: [ ^ self recordAndReportMatch: #(6) ].
	currentCharacter = $a
		ifTrue: [ ^ self scan15 ].
	currentCharacter = $e
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter = $r
				ifTrue: [ ^ self scan13 ].
			currentCharacter = $x
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter = $c
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter = $l
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter = $u
										ifTrue: [ 
											self recordMatch: #(26).
											self step.
											currentCharacter = $d
												ifTrue: [ 
													self recordMatch: #(26).
													self step.
													currentCharacter = $e
														ifTrue: [ 
															self recordMatch: #(26).
															self step.
															currentCharacter = $s
																ifTrue: [ 
																	self recordMatch: #(9 26).
																	self step ].
															(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
																ifTrue: [ 
																	[ 
																	self recordMatch: #(26).
																	self step.
																	currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
															^ self reportLastMatch ] ].
											(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
												ifTrue: [ 
													[ 
													self recordMatch: #(26).
													self step.
													currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
											^ self reportLastMatch ] ].
							(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
								ifTrue: [ 
									[ 
									self recordMatch: #(26).
									self step.
									currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
							^ self reportLastMatch ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(26).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $g
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter = $l
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter = $r
						ifTrue: [ 
							self recordMatch: #(20 26).
							self step.
							(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
								ifTrue: [ 
									[ 
									self recordMatch: #(26).
									self step.
									currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
							^ self reportLastMatch ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(26).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $h
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter = $a
										ifTrue: [ 
											self recordMatch: #(26).
											self step.
											currentCharacter = $r
												ifTrue: [ 
													self recordMatch: #(26).
													self step.
													currentCharacter = $c
														ifTrue: [ 
															self recordMatch: #(26).
															self step.
															currentCharacter = $h
																ifTrue: [ 
																	self recordMatch: #(26).
																	self step.
																	currentCharacter = $y
																		ifTrue: [ 
																			self recordMatch: #(11 26).
																			self step.
																			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
																				ifTrue: [ 
																					[ 
																					self recordMatch: #(26).
																					self step.
																					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
																			^ self reportLastMatch ] ].
															(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
																ifTrue: [ 
																	[ 
																	self recordMatch: #(26).
																	self step.
																	currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
															^ self reportLastMatch ] ].
											(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
												ifTrue: [ 
													[ 
													self recordMatch: #(26).
													self step.
													currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
											^ self reportLastMatch ] ].
							(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
								ifTrue: [ 
									[ 
									self recordMatch: #(26).
									self step.
									currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
							^ self reportLastMatch ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(26).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $i
		ifTrue: [ ^ self scan16 ].
	currentCharacter = $l
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter = $f
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter = $t
								ifTrue: [ 
									self recordMatch: #(15 26).
									self step ].
							(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
								ifTrue: [ 
									[ 
									self recordMatch: #(26).
									self step.
									currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
							^ self reportLastMatch ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(26).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $n
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter = $n
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter = $a
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter = $s
										ifTrue: [ 
											self recordMatch: #(26).
											self step.
											currentCharacter = $s
												ifTrue: [ 
													self recordMatch: #(26).
													self step.
													currentCharacter = $o
														ifTrue: [ 
															self recordMatch: #(26).
															self step.
															currentCharacter = $c
																ifTrue: [ 
																	self recordMatch: #(17 26).
																	self step ].
															(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
																ifTrue: [ 
																	[ 
																	self recordMatch: #(26).
																	self step.
																	currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
															^ self reportLastMatch ] ].
											(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
												ifTrue: [ 
													[ 
													self recordMatch: #(26).
													self step.
													currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
											^ self reportLastMatch ] ].
							(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
								ifTrue: [ 
									[ 
									self recordMatch: #(26).
									self step.
									currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
							^ self reportLastMatch ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(26).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $p
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter = $r
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter = $f
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter = $i
										ifTrue: [ 
											self recordMatch: #(26).
											self step.
											currentCharacter = $x
												ifTrue: [ 
													self recordMatch: #(13 26).
													self step ].
											(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
												ifTrue: [ 
													[ 
													self recordMatch: #(26).
													self step.
													currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
											^ self reportLastMatch ] ].
							(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
								ifTrue: [ 
									[ 
									self recordMatch: #(26).
									self step.
									currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
							^ self reportLastMatch ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(26).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $r
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter = $g
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter = $h
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter = $t
										ifTrue: [ 
											self recordMatch: #(16 26).
											self step ].
									(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
										ifTrue: [ 
											[ 
											self recordMatch: #(26).
											self step.
											currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
									^ self reportLastMatch ] ].
					(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
						ifTrue: [ 
							[ 
							self recordMatch: #(26).
							self step.
							currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
					^ self reportLastMatch ].
			currentCharacter = $o
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter = $o
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter = $t
								ifTrue: [ 
									self recordMatch: #(10 26).
									self step ].
							(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
								ifTrue: [ 
									[ 
									self recordMatch: #(26).
									self step.
									currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
							^ self reportLastMatch ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(26).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = $s
		ifTrue: [ 
			self recordMatch: #(26).
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter = $t
										ifTrue: [ 
											self recordMatch: #(19 26).
											self step ].
									(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
										ifTrue: [ 
											[ 
											self recordMatch: #(26).
											self step.
											currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
									^ self reportLastMatch ].
							currentCharacter = $t
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter = $e
										ifTrue: [ 
											self recordMatch: #(26).
											self step.
											currentCharacter = $s
												ifTrue: [ 
													self recordMatch: #(8 26).
													self step.
													(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
														ifTrue: [ 
															[ 
															self recordMatch: #(26).
															self step.
															currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
													^ self reportLastMatch ] ].
									(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
										ifTrue: [ 
											[ 
											self recordMatch: #(26).
											self step.
											currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
									^ self reportLastMatch ] ].
					(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
						ifTrue: [ 
							[ 
							self recordMatch: #(26).
							self step.
							currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
					^ self reportLastMatch ].
			currentCharacter = $u
				ifTrue: [ 
					self recordMatch: #(26).
					self step.
					currentCharacter = $f
						ifTrue: [ 
							self recordMatch: #(26).
							self step.
							currentCharacter = $f
								ifTrue: [ 
									self recordMatch: #(26).
									self step.
									currentCharacter = $i
										ifTrue: [ 
											self recordMatch: #(26).
											self step.
											currentCharacter = $x
												ifTrue: [ 
													self recordMatch: #(14 26).
													self step ].
											(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
												ifTrue: [ 
													[ 
													self recordMatch: #(26).
													self step.
													currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
											^ self reportLastMatch ] ].
							(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
								ifTrue: [ 
									[ 
									self recordMatch: #(26).
									self step.
									currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
							^ self reportLastMatch ] ].
			(currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ])
				ifTrue: [ 
					[ 
					self recordMatch: #(26).
					self step.
					currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
			^ self reportLastMatch ].
	currentCharacter = ${
		ifTrue: [ ^ self recordAndReportMatch: #(29) ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(2) ].
	(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
		ifTrue: [ 
			[ 
			self recordMatch: #(24).
			self step.
			currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue.
			^ self reportLastMatch ].
	(currentCharacter isLetter or: [ currentCharacter = $_ ])
		ifTrue: [ 
			[ 
			self recordMatch: #(26).
			self step.
			currentCharacter isAlphaNumeric or: [ currentCharacter = $_ ] ] whileTrue ].
	^ self reportLastMatch