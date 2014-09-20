generated
scan71
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $r
				ifTrue: [ 
					self step.
					currentCharacter = $o
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $x
										ifTrue: [ 
											self step.
											currentCharacter = $t
												ifTrue: [ ^ self recordAndReportMatch: #(43) ] ].
									^ self reportLastMatch ].
							currentCharacter = $i
								ifTrue: [ 
									self step.
									currentCharacter = $n
										ifTrue: [ 
											self step.
											currentCharacter = $i
												ifTrue: [ 
													self step.
													currentCharacter = $t
														ifTrue: [ 
															self step.
															currentCharacter = $i
																ifTrue: [ 
																	self step.
																	currentCharacter = $a
																		ifTrue: [ 
																			self step.
																			currentCharacter = $l
																				ifTrue: [ 
																					self step.
																					currentCharacter = $i
																						ifTrue: [ 
																							self step.
																							currentCharacter = $z
																								ifTrue: [ 
																									self step.
																									currentCharacter = $e
																										ifTrue: [ 
																											self step.
																											currentCharacter = $r
																												ifTrue: [ ^ self recordAndReportMatch: #(99) ] ] ] ] ] ] ] ] ] ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $x
				ifTrue: [ 
					self step.
					currentCharacter = $t
						ifTrue: [ ^ self recordAndReportMatch: #(197) ] ] ].
	^ self reportLastMatch