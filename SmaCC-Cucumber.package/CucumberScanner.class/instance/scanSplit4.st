generated
scanSplit4
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
														ifTrue: [ 
															self recordMatch: #(1).
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
								or: [ (currentCharacter between: $b and: ${) or: [ currentCharacter >= $} ] ] ] ])
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
	^ self reportLastMatch