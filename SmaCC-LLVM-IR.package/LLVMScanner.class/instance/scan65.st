generated
scan65
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $k
						ifTrue: [ 
							self recordMatch: #(133).
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
														ifTrue: [ ^ self recordAndReportMatch: #(174) ] ] ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $b
				ifTrue: [ 
					self step.
					currentCharacter = $k
						ifTrue: [ 
							self step.
							currentCharacter = $i
								ifTrue: [ 
									self step.
									currentCharacter = $t
										ifTrue: [ 
											self step.
											currentCharacter = $_
												ifTrue: [ 
													self step.
													currentCharacter = $j
														ifTrue: [ 
															self step.
															currentCharacter = $s
																ifTrue: [ 
																	2
																		timesRepeat: [ 
																			self step.
																			currentCharacter = $c
																				ifFalse: [ ^ self reportLastMatch ] ].
																	^ self recordAndReportMatch: #(183) ] ] ] ] ] ] ] ].
	^ self reportLastMatch