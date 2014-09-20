generated
scan38
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $r
				ifTrue: [ 
					self step.
					currentCharacter = $t
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $l
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ 
													self step.
													currentCharacter = $m
														ifTrue: [ 
															self step.
															currentCharacter = $e
																ifTrue: [ 
																	self step.
																	currentCharacter = $n
																		ifTrue: [ 
																			self step.
																			currentCharacter = $t
																				ifTrue: [ ^ self recordAndReportMatch: #(73) ] ] ] ] ] ].
									^ self reportLastMatch ].
							currentCharacter = $v
								ifTrue: [ 
									self step.
									currentCharacter = $a
										ifTrue: [ 
											self step.
											currentCharacter = $l
												ifTrue: [ 
													self step.
													currentCharacter = $u
														ifTrue: [ 
															self step.
															currentCharacter = $e
																ifTrue: [ ^ self recordAndReportMatch: #(89) ] ] ] ] ] ] ] ].
	^ self reportLastMatch