generated
scan52
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $d
						ifTrue: [ 
							self step.
							currentCharacter = $n
								ifTrue: [ 
									self step.
									currentCharacter = $o
										ifTrue: [ 
											self step.
											currentCharacter = $n
												ifTrue: [ 
													self step.
													currentCharacter = $e
														ifTrue: [ ^ self recordAndReportMatch: #(15) ] ] ].
									^ self reportLastMatch ].
							currentCharacter = $o
								ifTrue: [ 
									self step.
									currentCharacter = $n
										ifTrue: [ 
											self step.
											currentCharacter = $l
												ifTrue: [ 
													self step.
													currentCharacter = $y
														ifTrue: [ ^ self recordAndReportMatch: #(11) ] ] ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $l
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $a
								ifTrue: [ 
									self step.
									currentCharacter = $s
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ ^ self recordAndReportMatch: #(212) ] ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $s
				ifTrue: [ 
					self step.
					currentCharacter = $u
						ifTrue: [ 
							self step.
							currentCharacter = $m
								ifTrue: [ 
									self step.
									currentCharacter = $e
										ifTrue: [ ^ self recordAndReportMatch: #(34) ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $t
				ifTrue: [ 
					self recordMatch: #(52).
					self step.
					currentCharacter = $u
						ifTrue: [ 
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self step.
									currentCharacter = $n
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ 
													self step.
													currentCharacter = $d
														ifTrue: [ ^ self recordAndReportMatch: #(142) ].
													^ self reportLastMatch ].
											currentCharacter = $s
												ifTrue: [ 
													self step.
													currentCharacter = $_
														ifTrue: [ 
															self step.
															currentCharacter = $t
																ifTrue: [ 
																	self step.
																	currentCharacter = $w
																		ifTrue: [ 
																			self step.
																			currentCharacter = $i
																				ifTrue: [ 
																					self step.
																					currentCharacter = $c
																						ifTrue: [ 
																							self step.
																							currentCharacter = $e
																								ifTrue: [ ^ self recordAndReportMatch: #(10) ] ] ] ] ] ] ] ] ] ] ] ].
	^ self reportLastMatch