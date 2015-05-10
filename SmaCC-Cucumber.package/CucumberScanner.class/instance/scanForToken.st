generated
scanForToken
	state == #inRow
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(14) ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan6 ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space ])
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(14) ].
					currentCharacter = Character cr
						ifTrue: [ ^ self scan6 ].
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(13) ].
					currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
					^ self scan5 ].
			(currentCharacter <= Character backspace
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: Character arrowDown)
								or: [ (currentCharacter between: $! and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	state == #lineBegin
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(11) ].
			currentCharacter = Character cr
				ifTrue: [ 
					self recordMatch: #(11).
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(11) ].
					^ self reportLastMatch ].
			currentCharacter = $#
				ifTrue: [ 
					[ 
					self recordMatch: #(10).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			currentCharacter = $@
				ifTrue: [ 
					self step.
					(currentCharacter <= Character backspace
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: Character arrowDown)
										or: [ (currentCharacter between: $! and: $?) or: [ currentCharacter >= $A ] ] ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(9).
							self step.
							currentCharacter <= Character backspace
								or: [ 
									(currentCharacter between: Character pageUp and: Character newPage)
										or: [ 
											(currentCharacter between: (Character value: 14) and: Character arrowDown)
												or: [ (currentCharacter between: $! and: $?) or: [ currentCharacter >= $A ] ] ] ] ] whileTrue ].
					^ self reportLastMatch ].
			currentCharacter = $A
				ifTrue: [ 
					self step.
					currentCharacter = $n
						ifTrue: [ 
							self step.
							currentCharacter = $d
								ifTrue: [ ^ self recordAndReportMatch: #(2) ] ].
					^ self reportLastMatch ].
			currentCharacter = $B
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $c
								ifTrue: [ 
									self step.
									currentCharacter = $k
										ifTrue: [ 
											self step.
											currentCharacter = $g
												ifTrue: [ 
													self step.
													currentCharacter = $r
														ifTrue: [ 
															self step.
															currentCharacter = $o
																ifTrue: [ 
																	self step.
																	currentCharacter = $u
																		ifTrue: [ 
																			self step.
																			currentCharacter = $n
																				ifTrue: [ 
																					self step.
																					currentCharacter = $d
																						ifTrue: [ 
																							self step.
																							currentCharacter = $:
																								ifTrue: [ ^ self recordAndReportMatch: #(7) ] ] ] ] ] ] ] ] ].
							^ self reportLastMatch ].
					currentCharacter = $u
						ifTrue: [ 
							self step.
							currentCharacter = $t
								ifTrue: [ ^ self recordAndReportMatch: #(2) ] ].
					^ self reportLastMatch ].
			currentCharacter = $E
				ifTrue: [ 
					self step.
					currentCharacter = $x
						ifTrue: [ 
							self step.
							currentCharacter = $a
								ifTrue: [ 
									self step.
									currentCharacter = $m
										ifTrue: [ 
											self step.
											currentCharacter = $p
												ifTrue: [ 
													self step.
													currentCharacter = $l
														ifTrue: [ 
															self step.
															currentCharacter = $e
																ifTrue: [ 
																	self step.
																	currentCharacter = $s
																		ifTrue: [ 
																			self step.
																			currentCharacter = $:
																				ifTrue: [ ^ self recordAndReportMatch: #(4) ] ] ] ] ] ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $F
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $a
								ifTrue: [ 
									self step.
									currentCharacter = $t
										ifTrue: [ 
											self step.
											currentCharacter = $u
												ifTrue: [ 
													self step.
													currentCharacter = $r
														ifTrue: [ 
															self step.
															currentCharacter = $e
																ifTrue: [ 
																	self step.
																	currentCharacter = $:
																		ifTrue: [ ^ self recordAndReportMatch: #(6) ] ] ] ] ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $G
				ifTrue: [ 
					self step.
					currentCharacter = $i
						ifTrue: [ 
							self step.
							currentCharacter = $v
								ifTrue: [ ^ self scan7 ] ].
					^ self reportLastMatch ].
			currentCharacter = $S
				ifTrue: [ 
					self step.
					currentCharacter = $c
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $n
										ifTrue: [ 
											self step.
											currentCharacter = $a
												ifTrue: [ 
													self step.
													currentCharacter = $r
														ifTrue: [ 
															self step.
															currentCharacter = $i
																ifTrue: [ 
																	self step.
																	currentCharacter = $o
																		ifTrue: [ 
																			self step.
																			currentCharacter = Character space
																				ifTrue: [ 
																					self step.
																					currentCharacter = $O
																						ifTrue: [ 
																							self step.
																							currentCharacter = $u
																								ifTrue: [ 
																									self step.
																									currentCharacter = $t
																										ifTrue: [ 
																											self step.
																											currentCharacter = $l
																												ifTrue: [ 
																													self step.
																													currentCharacter = $i
																														ifTrue: [ 
																															self step.
																															currentCharacter = $n
																																ifTrue: [ 
																																	self step.
																																	currentCharacter = $e
																																		ifTrue: [ 
																																			self step.
																																			currentCharacter = $:
																																				ifTrue: [ ^ self recordAndReportMatch: #(5) ] ] ] ] ] ] ] ].
																					^ self reportLastMatch ].
																			currentCharacter = $:
																				ifTrue: [ ^ self recordAndReportMatch: #(3) ] ] ] ] ] ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(8) ].
			currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
			('TW' includes: currentCharacter)
				ifTrue: [ 
					self step.
					currentCharacter = $h
						ifTrue: [ ^ self scan7 ] ].
			^ self reportLastMatch ].
	state == #default
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(15) ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $"
				ifTrue: [ ^ self scan2 ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space ])
				ifTrue: [ 
					[ 
					self recordMatch: #(12).
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(15) ].
					currentCharacter = Character cr
						ifTrue: [ ^ self scan1 ].
					currentCharacter = $"
						ifTrue: [ ^ self scan2 ].
					currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue ].
			true
				ifTrue: [ 
					[ 
					self recordMatch: #(12).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue ] ].
	^ self reportLastMatch