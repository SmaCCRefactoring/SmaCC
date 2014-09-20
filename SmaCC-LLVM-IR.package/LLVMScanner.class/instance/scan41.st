generated
scan41
	self step.
	currentCharacter = $n
		ifTrue: [ 
			self step.
			currentCharacter = $k
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self step.
									currentCharacter = $_
										ifTrue: [ 
											self step.
											currentCharacter = $p
												ifTrue: [ 
													self step.
													currentCharacter = $r
														ifTrue: [ 
															self step.
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
																								ifTrue: [ 
																									self recordMatch: #(127).
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
																																		ifTrue: [ 
																																			self recordMatch: #(129).
																																			self step.
																																			currentCharacter = $_
																																				ifTrue: [ 
																																					self step.
																																					currentCharacter = $d
																																						ifTrue: [ 
																																							self step.
																																							currentCharacter = $e
																																								ifTrue: [ 
																																									self step.
																																									currentCharacter = $f
																																										ifTrue: [ 
																																											self step.
																																											currentCharacter = $_
																																												ifTrue: [ 
																																													self step.
																																													currentCharacter = $a
																																														ifTrue: [ 
																																															self step.
																																															currentCharacter = $u
																																																ifTrue: [ 
																																																	self step.
																																																	currentCharacter = $t
																																																		ifTrue: [ 
																																																			self step.
																																																			currentCharacter = $o
																																																				ifTrue: [ ^ self recordAndReportMatch: #(137) ] ] ] ] ] ] ] ] ] ] ] ] ] ] ] ] ] ] ] ] ] ] ].
							^ self reportLastMatch ].
					currentCharacter = $o
						ifTrue: [ 
							self step.
							currentCharacter = $n
								ifTrue: [ 
									self step.
									currentCharacter = $c
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ 
													self recordMatch: #(134).
													self step.
													currentCharacter = $_
														ifTrue: [ 
															self step.
															currentCharacter = $o
																ifTrue: [ 
																	self step.
																	currentCharacter = $d
																		ifTrue: [ 
																			self step.
																			currentCharacter = $r
																				ifTrue: [ ^ self recordAndReportMatch: #(177) ] ] ] ] ] ] ] ] ] ].
	^ self reportLastMatch