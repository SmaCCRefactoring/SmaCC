generated
scan40
	self step.
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $b
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $l
								ifTrue: [ ^ self recordAndReportMatch: #(61) ] ].
					^ self reportLastMatch ].
			currentCharacter = $n
				ifTrue: [ 
					self step.
					currentCharacter = $d
						ifTrue: [ 
							self step.
							currentCharacter = $i
								ifTrue: [ 
									self step.
									currentCharacter = $n
										ifTrue: [ 
											self step.
											currentCharacter = $g
												ifTrue: [ 
													self step.
													currentCharacter = $p
														ifTrue: [ 
															self step.
															currentCharacter = $a
																ifTrue: [ 
																	self step.
																	currentCharacter = $d
																		ifTrue: [ ^ self recordAndReportMatch: #(220) ] ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $i
		ifTrue: [ ^ self scan41 ].
	currentCharacter = $o
		ifTrue: [ 
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $d
						ifTrue: [ ^ self recordAndReportMatch: #(41) ].
					^ self reportLastMatch ].
			currentCharacter = $c
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $l
								ifTrue: [ 
									self step.
									currentCharacter = $d
										ifTrue: [ 
											self step.
											currentCharacter = $y
												ifTrue: [ 
													self step.
													currentCharacter = $n
														ifTrue: [ 
															self step.
															currentCharacter = $a
																ifTrue: [ 
																	self step.
																	currentCharacter = $m
																		ifTrue: [ 
																			self step.
																			currentCharacter = $i
																				ifTrue: [ 
																					self step.
																					currentCharacter = $c
																						ifTrue: [ ^ self recordAndReportMatch: #(120) ] ] ] ] ] ].
											^ self reportLastMatch ].
									currentCharacter = $e
										ifTrue: [ 
											self step.
											currentCharacter = $x
												ifTrue: [ 
													self step.
													currentCharacter = $e
														ifTrue: [ 
															self step.
															currentCharacter = $c
																ifTrue: [ ^ self recordAndReportMatch: #(31) ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $s
		ifTrue: [ 
			self step.
			currentCharacter = $h
				ifTrue: [ 
					self step.
					currentCharacter = $r
						ifTrue: [ ^ self recordAndReportMatch: #(114) ] ] ].
	^ self reportLastMatch