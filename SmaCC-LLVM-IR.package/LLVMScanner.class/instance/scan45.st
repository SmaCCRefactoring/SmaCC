generated
scan45
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
							currentCharacter = $i
								ifTrue: [ 
									self step.
									currentCharacter = $c
										ifTrue: [ 
											self step.
											currentCharacter = $i
												ifTrue: [ 
													self step.
													currentCharacter = $t
														ifTrue: [ 
															self step.
															currentCharacter = $f
																ifTrue: [ 
																	self step.
																	currentCharacter = $l
																		ifTrue: [ 
																			self step.
																			currentCharacter = $o
																				ifTrue: [ 
																					self step.
																					currentCharacter = $a
																						ifTrue: [ 
																							self step.
																							currentCharacter = $t
																								ifTrue: [ ^ self recordAndReportMatch: #(7) ] ] ] ] ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $n
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
										ifTrue: [ ^ self recordAndReportMatch: #(3) ] ] ] ] ].
	^ self reportLastMatch