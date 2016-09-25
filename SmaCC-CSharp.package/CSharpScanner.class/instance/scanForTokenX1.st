generated
scanForTokenX1
	self step.
	currentCharacter == $\
		ifTrue: [ self step.
			currentCharacter == $x
				ifTrue: [ self step.
					(currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ self step.
							currentCharacter == $'
								ifTrue: [ ^ self recordAndReportMatch: #(157) ].
							(currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ self step.
									currentCharacter == $'
										ifTrue: [ ^ self recordAndReportMatch: #(157) ].
									(currentCharacter isDigit
										or: [ (currentCharacter between: $A and: $F)
												or: [ currentCharacter between: $a and: $f ] ])
										ifTrue: [ self step.
											currentCharacter == $'
												ifTrue: [ ^ self recordAndReportMatch: #(157) ].
											(currentCharacter isDigit
												or: [ (currentCharacter between: $A and: $F)
														or: [ currentCharacter between: $a and: $f ] ])
												ifTrue: [ ^ self scan3 ] ] ] ].
					^ self reportLastMatch ].
			('Uu' includes: currentCharacter)
				ifTrue: [ self step.
					(currentCharacter isDigit
						or: [ (currentCharacter between: $A and: $F)
								or: [ currentCharacter between: $a and: $f ] ])
						ifTrue: [ self step.
							(currentCharacter isDigit
								or: [ (currentCharacter between: $A and: $F)
										or: [ currentCharacter between: $a and: $f ] ])
								ifTrue: [ self step.
									(currentCharacter isDigit
										or: [ (currentCharacter between: $A and: $F)
												or: [ currentCharacter between: $a and: $f ] ])
										ifTrue: [ self step.
											(currentCharacter isDigit
												or: [ (currentCharacter between: $A and: $F)
														or: [ currentCharacter between: $a and: $f ] ])
												ifTrue: [ self step.
													currentCharacter == $'
														ifTrue: [ ^ self recordAndReportMatch: #(157) ].
													(currentCharacter isDigit
														or: [ (currentCharacter between: $A and: $F)
																or: [ currentCharacter between: $a and: $f ] ])
														ifTrue: [ self step.
															(currentCharacter isDigit
																or: [ (currentCharacter between: $A and: $F)
																		or: [ currentCharacter between: $a and: $f ] ])
																ifTrue: [ self step.
																	(currentCharacter isDigit
																		or: [ (currentCharacter between: $A and: $F)
																				or: [ currentCharacter between: $a and: $f ] ])
																		ifTrue: [ self step.
																			(currentCharacter isDigit
																				or: [ (currentCharacter between: $A and: $F)
																						or: [ currentCharacter between: $a and: $f ] ])
																				ifTrue: [ ^ self scan3 ] ] ] ] ] ] ] ].
					^ self reportLastMatch ].
			(('"''0\' includes: currentCharacter)
				or: [ (currentCharacter between: $a and: $b)
						or:
							[ 'fnrtv' includes: currentCharacter ] ])
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	(currentCharacter <= Character tab
		or: [ (currentCharacter between: Character pageUp and: $&)
				or: [ (currentCharacter between: $( and: $[)
						or: [ currentCharacter >= $] ] ] ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch