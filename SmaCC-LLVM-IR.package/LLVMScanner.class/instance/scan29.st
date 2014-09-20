generated
scan29
	self step.
	currentCharacter = $q
		ifTrue: [ ^ self recordAndReportMatch: #(196) ].
	currentCharacter = $x
		ifTrue: [ 
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $c
						ifTrue: [ 
							self step.
							currentCharacter = $t
								ifTrue: [ ^ self recordAndReportMatch: #(121) ] ].
					^ self reportLastMatch ].
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self step.
									currentCharacter = $n
										ifTrue: [ 
											self step.
											currentCharacter = $_
												ifTrue: [ 
													self step.
													currentCharacter = $w
														ifTrue: [ 
															self step.
															currentCharacter = $e
																ifTrue: [ 
																	self step.
																	currentCharacter = $a
																		ifTrue: [ 
																			self step.
																			currentCharacter = $k
																				ifTrue: [ ^ self recordAndReportMatch: #(146) ] ] ] ].
													^ self reportLastMatch ].
											currentCharacter = $a
												ifTrue: [ 
													self step.
													currentCharacter = $l
														ifTrue: [ ^ self recordAndReportMatch: #(176) ] ] ] ].
							^ self reportLastMatch ].
					currentCharacter = $r
						ifTrue: [ 
							self step.
							currentCharacter = $a
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
																										ifTrue: [ ^ self recordAndReportMatch: #(77) ] ] ] ] ] ].
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
																						ifTrue: [ ^ self recordAndReportMatch: #(71) ] ] ] ] ] ] ] ] ] ] ].
	^ self reportLastMatch