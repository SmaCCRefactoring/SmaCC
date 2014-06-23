generated
scan34
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
																						ifTrue: [ 
																							self recordMatch: #(13).
																							self step.
																							currentCharacter = $|
																								ifTrue: [ ^ self recordAndReportMatch: #(10) ].
																							(currentCharacter <= Character tab
																								or: [ 
																									(currentCharacter between: Character pageUp and: Character newPage)
																										or: [ (currentCharacter between: (Character value: 14) and: ${) or: [ currentCharacter >= $} ] ] ])
																								ifTrue: [ ^ self scan8 ].
																							^ self reportLastMatch ].
																					currentCharacter = $|
																						ifTrue: [ ^ self recordAndReportMatch: #(10) ].
																					(currentCharacter <= Character tab
																						or: [ 
																							(currentCharacter between: Character pageUp and: Character newPage)
																								or: [ 
																									(currentCharacter between: (Character value: 14) and: $9)
																										or: [ (currentCharacter between: $; and: ${) or: [ currentCharacter >= $} ] ] ] ])
																						ifTrue: [ ^ self scan8 ].
																					^ self reportLastMatch ].
																			currentCharacter = $|
																				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
																			(currentCharacter <= Character tab
																				or: [ 
																					(currentCharacter between: Character pageUp and: Character newPage)
																						or: [ 
																							(currentCharacter between: (Character value: 14) and: $d)
																								or: [ (currentCharacter between: $f and: ${) or: [ currentCharacter >= $} ] ] ] ])
																				ifTrue: [ ^ self scan8 ].
																			^ self reportLastMatch ].
																	currentCharacter = $|
																		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
																	(currentCharacter <= Character tab
																		or: [ 
																			(currentCharacter between: Character pageUp and: Character newPage)
																				or: [ 
																					(currentCharacter between: (Character value: 14) and: $m)
																						or: [ (currentCharacter between: $o and: ${) or: [ currentCharacter >= $} ] ] ] ])
																		ifTrue: [ ^ self scan8 ].
																	^ self reportLastMatch ].
															currentCharacter = $|
																ifTrue: [ ^ self recordAndReportMatch: #(10) ].
															(currentCharacter <= Character tab
																or: [ 
																	(currentCharacter between: Character pageUp and: Character newPage)
																		or: [ 
																			(currentCharacter between: (Character value: 14) and: $h)
																				or: [ (currentCharacter between: $j and: ${) or: [ currentCharacter >= $} ] ] ] ])
																ifTrue: [ ^ self scan8 ].
															^ self reportLastMatch ].
													currentCharacter = $|
														ifTrue: [ ^ self recordAndReportMatch: #(10) ].
													(currentCharacter <= Character tab
														or: [ 
															(currentCharacter between: Character pageUp and: Character newPage)
																or: [ 
																	(currentCharacter between: (Character value: 14) and: $k)
																		or: [ (currentCharacter between: $m and: ${) or: [ currentCharacter >= $} ] ] ] ])
														ifTrue: [ ^ self scan8 ].
													^ self reportLastMatch ].
											currentCharacter = $|
												ifTrue: [ ^ self recordAndReportMatch: #(10) ].
											(currentCharacter <= Character tab
												or: [ 
													(currentCharacter between: Character pageUp and: Character newPage)
														or: [ 
															(currentCharacter between: (Character value: 14) and: $s)
																or: [ (currentCharacter between: $u and: ${) or: [ currentCharacter >= $} ] ] ] ])
												ifTrue: [ ^ self scan8 ].
											^ self reportLastMatch ].
									currentCharacter = $|
										ifTrue: [ ^ self recordAndReportMatch: #(10) ].
									(currentCharacter <= Character tab
										or: [ 
											(currentCharacter between: Character pageUp and: Character newPage)
												or: [ 
													(currentCharacter between: (Character value: 14) and: $t)
														or: [ (currentCharacter between: $v and: ${) or: [ currentCharacter >= $} ] ] ] ])
										ifTrue: [ ^ self scan8 ].
									^ self reportLastMatch ].
							currentCharacter = $|
								ifTrue: [ ^ self recordAndReportMatch: #(10) ].
							(currentCharacter <= Character tab
								or: [ 
									(currentCharacter between: Character pageUp and: Character newPage)
										or: [ 
											(currentCharacter between: (Character value: 14) and: $N)
												or: [ (currentCharacter between: $P and: ${) or: [ currentCharacter >= $} ] ] ] ])
								ifTrue: [ ^ self scan8 ].
							^ self reportLastMatch ].
					currentCharacter = $:
						ifTrue: [ 
							self recordMatch: #(14).
							self step.
							currentCharacter = $|
								ifTrue: [ ^ self recordAndReportMatch: #(10) ].
							(currentCharacter <= Character tab
								or: [ 
									(currentCharacter between: Character pageUp and: Character newPage)
										or: [ (currentCharacter between: (Character value: 14) and: ${) or: [ currentCharacter >= $} ] ] ])
								ifTrue: [ ^ self scan8 ].
							^ self reportLastMatch ].
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(10) ].
					(currentCharacter <= Character tab
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: Character arrowDown)
										or: [ (currentCharacter between: $! and: $9) or: [ (currentCharacter between: $; and: ${) or: [ currentCharacter >= $} ] ] ] ] ])
						ifTrue: [ ^ self scan8 ].
					^ self reportLastMatch ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $n)
								or: [ (currentCharacter between: $p and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan8 ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $h)
						or: [ (currentCharacter between: $j and: ${) or: [ currentCharacter >= $} ] ] ] ])
		ifTrue: [ ^ self scan8 ].
	^ self reportLastMatch