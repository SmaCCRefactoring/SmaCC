generated
scanSplit3
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
																ifTrue: [ 
																	self recordMatch: #(12).
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
																	(currentCharacter between: (Character value: 14) and: $r)
																		or: [ (currentCharacter between: $t and: ${) or: [ currentCharacter >= $} ] ] ] ])
														ifTrue: [ ^ self scan7 ].
													^ self reportLastMatch ].
											currentCharacter = $|
												ifTrue: [ ^ self recordAndReportMatch: #(10) ].
											(currentCharacter <= Character tab
												or: [ 
													(currentCharacter between: Character pageUp and: Character newPage)
														or: [ 
															(currentCharacter between: (Character value: 14) and: $d)
																or: [ (currentCharacter between: $f and: ${) or: [ currentCharacter >= $} ] ] ] ])
												ifTrue: [ ^ self scan7 ].
											^ self reportLastMatch ].
									currentCharacter = $|
										ifTrue: [ ^ self recordAndReportMatch: #(10) ].
									(currentCharacter <= Character tab
										or: [ 
											(currentCharacter between: Character pageUp and: Character newPage)
												or: [ 
													(currentCharacter between: (Character value: 14) and: $k)
														or: [ (currentCharacter between: $m and: ${) or: [ currentCharacter >= $} ] ] ] ])
										ifTrue: [ ^ self scan7 ].
									^ self reportLastMatch ].
							currentCharacter = $|
								ifTrue: [ ^ self recordAndReportMatch: #(10) ].
							(currentCharacter <= Character tab
								or: [ 
									(currentCharacter between: Character pageUp and: Character newPage)
										or: [ 
											(currentCharacter between: (Character value: 14) and: $o)
												or: [ (currentCharacter between: $q and: ${) or: [ currentCharacter >= $} ] ] ] ])
								ifTrue: [ ^ self scan7 ].
							^ self reportLastMatch ].
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(10) ].
					(currentCharacter <= Character tab
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: $l)
										or: [ (currentCharacter between: $n and: ${) or: [ currentCharacter >= $} ] ] ] ])
						ifTrue: [ ^ self scan7 ].
					^ self reportLastMatch ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(10) ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $`)
								or: [ (currentCharacter between: $b and: ${) or: [ currentCharacter >= $} ] ] ] ])
				ifTrue: [ ^ self scan7 ].
			^ self reportLastMatch ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(10) ].
	(currentCharacter <= Character tab
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: $w)
						or: [ (currentCharacter between: $y and: ${) or: [ currentCharacter >= $} ] ] ] ])
		ifTrue: [ ^ self scan7 ].
	^ self reportLastMatch