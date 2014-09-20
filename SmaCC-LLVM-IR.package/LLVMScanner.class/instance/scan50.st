generated
scan50
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $f
				ifTrue: [ 
					self step.
					currentCharacter = $i
						ifTrue: [ 
							self step.
							currentCharacter = $x
								ifTrue: [ ^ self recordAndReportMatch: #(21) ] ].
					^ self reportLastMatch ].
			currentCharacter = $s
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self step.
									currentCharacter = $v
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ 
													self step.
													currentCharacter = $_
														ifTrue: [ 
															self step.
															currentCharacter = $a
																ifTrue: [ 
																	self step.
																	currentCharacter = $l
																		ifTrue: [ 
																			self step.
																			currentCharacter = $l
																				ifTrue: [ 
																					2
																						timesRepeat: [ 
																							self step.
																							currentCharacter = $c
																								ifFalse: [ ^ self reportLastMatch ] ].
																					^ self recordAndReportMatch: #(180) ] ].
																	^ self reportLastMatch ].
															currentCharacter = $m
																ifTrue: [ 
																	self step.
																	currentCharacter = $o
																		ifTrue: [ 
																			self step.
																			currentCharacter = $s
																				ifTrue: [ 
																					self step.
																					currentCharacter = $t
																						ifTrue: [ 
																							2
																								timesRepeat: [ 
																									self step.
																									currentCharacter = $c
																										ifFalse: [ ^ self reportLastMatch ] ].
																							^ self recordAndReportMatch: #(184) ] ] ] ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $i
		ifTrue: [ 
			self step.
			currentCharacter = $v
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $t
								ifTrue: [ 
									self step.
									currentCharacter = $e
										ifTrue: [ ^ self recordAndReportMatch: #(124) ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $o
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $c
								ifTrue: [ 
									self step.
									currentCharacter = $t
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ 
													self step.
													currentCharacter = $d
														ifTrue: [ ^ self recordAndReportMatch: #(40) ] ] ] ] ] ] ].
	^ self reportLastMatch