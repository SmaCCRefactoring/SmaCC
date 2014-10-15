generated
scanSplit2
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
																				ifTrue: [ 
																					self recordMatch: #(15).
																					self step.
																					currentCharacter = $|
																						ifTrue: [ ^ self recordAndReportMatch: #(10) ].
																					(currentCharacter <= Character tab
																						or: [ 
																							(currentCharacter between: Character pageUp and: Character newPage)
																								or: [ (currentCharacter between: (Character value: 14) and: ${) or: [ currentCharacter >= $} ] ] ])
																						ifTrue: [ ^ self scan7 ].
																					^ self reportLastMatch ].
																			currentCharacter = $|
																				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
																			(currentCharacter <= Character tab
																				or: [ 
																					(currentCharacter between: Character pageUp and: Character newPage)
																						or: [ 
																							(currentCharacter between: (Character value: 14) and: $9)
																								or: [ (currentCharacter between: $; and: ${) or: [ currentCharacter >= $} ] ] ] ])
																				ifTrue: [ ^ self scan7 ].
																			^ self reportLastMatch ].
																	currentCharacter = $|
																		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
																	(currentCharacter <= Character tab
																		or: [ 
																			(currentCharacter between: Character pageUp and: Character newPage)
																				or: [ 
																					(currentCharacter between: (Character value: 14) and: $c)
																						or: [ (currentCharacter between: $e and: ${) or: [ currentCharacter >= $} ] ] ] ])
																		ifTrue: [ ^ self scan7 ].
																	^ self reportLastMatch ].
															currentCharacter = $|
																ifTrue: [ ^ self recordAndReportMatch: #(10) ].
															(currentCharacter <= Character tab
																or: [ 
																	(currentCharacter between: Character pageUp and: Character newPage)
																		or: [ 
																			(currentCharacter between: (Character value: 14) and: $m)
																				or: [ (currentCharacter between: $o and: ${) or: [ currentCharacter >= $} ] ] ] ])
																ifTrue: [ ^ self scan7 ].
															^ self reportLastMatch ].
													currentCharacter = $|
														ifTrue: [ ^ self recordAndReportMatch: #(10) ].
													(currentCharacter <= Character tab
														or: [ 
															(currentCharacter between: Character pageUp and: Character newPage)
																or: [ 
																	(currentCharacter between: (Character value: 14) and: $t)
																		or: [ (currentCharacter between: $v and: ${) or: [ currentCharacter >= $} ] ] ] ])
														ifTrue: [ ^ self scan7 ].
													^ self reportLastMatch ].
											currentCharacter = $|
												ifTrue: [ ^ self recordAndReportMatch: #(10) ].
											(currentCharacter <= Character tab
												or: [ 
													(currentCharacter between: Character pageUp and: Character newPage)
														or: [ 
															(currentCharacter between: (Character value: 14) and: $n)
																or: [ (currentCharacter between: $p and: ${) or: [ currentCharacter >= $} ] ] ] ])
												ifTrue: [ ^ self scan7 ].
											^ self reportLastMatch ].
									currentCharacter = $|
										ifTrue: [ ^ self recordAndReportMatch: #(10) ].
									(currentCharacter <= Character tab
										or: [ 
											(currentCharacter between: Character pageUp and: Character newPage)
												or: [ 
													(currentCharacter between: (Character value: 14) and: $q)
														or: [ (currentCharacter between: $s and: ${) or: [ currentCharacter >= $} ] ] ] ])
										ifTrue: [ ^ self scan7 ].
									^ self reportLastMatch ].
							currentCharacter = $|
								ifTrue: [ ^ self recordAndReportMatch: #(10) ].
							(currentCharacter <= Character tab
								or: [ 
									(currentCharacter between: Character pageUp and: Character newPage)
										or: [ 
											(currentCharacter between: (Character value: 14) and: $f)
												or: [ (currentCharacter between: $h and: ${) or: [ currentCharacter >= $} ] ] ] ])
								ifTrue: [ ^ self scan7 ].
							^ self reportLastMatch ].
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(10) ].
					(currentCharacter <= Character tab
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: $j)
										or: [ (currentCharacter between: $l and: ${) or: [ currentCharacter >= $} ] ] ] ])
						ifTrue: [ ^ self scan7 ].
					^ self reportLastMatch ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $b)
								or: [ (currentCharacter between: $d and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter = $u
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ ^ self scan21 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $s)
								or: [ (currentCharacter between: $u and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $`)
						or: [ (currentCharacter between: $b and: $t) or: [ (currentCharacter between: $v and: ${) or: [ currentCharacter >= $} ] ] ] ] ])
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch