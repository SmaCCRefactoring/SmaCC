generated
scan26
	self step.
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $l
				ifTrue: [ 
					self step.
					currentCharacter = $l
						ifTrue: [ ^ self recordAndReportMatch: #(223) ].
					^ self reportLastMatch ].
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $c
						ifTrue: [ 
							self step.
							currentCharacter = $h
								ifTrue: [ ^ self recordAndReportMatch: #(229) ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $c
		ifTrue: [ 
			self recordMatch: #(165).
			self step.
			currentCharacter = $c
				ifTrue: [ ^ self recordAndReportMatch: #(170) ].
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
							currentCharacter = $n
								ifTrue: [ 
									self step.
									currentCharacter = $u
										ifTrue: [ 
											self step.
											currentCharacter = $p
												ifTrue: [ ^ self recordAndReportMatch: #(230) ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $m
		ifTrue: [ 
			self step.
			currentCharacter = $p
				ifTrue: [ 
					self step.
					currentCharacter = $x
						ifTrue: [ 
							self step.
							currentCharacter = $c
								ifTrue: [ 
									self step.
									currentCharacter = $h
										ifTrue: [ 
											self step.
											currentCharacter = $g
												ifTrue: [ ^ self recordAndReportMatch: #(201) ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $o
		ifTrue: [ 
			self step.
			currentCharacter = $l
				ifTrue: [ 
					self step.
					currentCharacter = $d
						ifTrue: [ 
							self recordMatch: #(25).
							2
								timesRepeat: [ 
									self step.
									currentCharacter = $c
										ifFalse: [ ^ self reportLastMatch ] ].
							^ self recordAndReportMatch: #(175) ].
					^ self reportLastMatch ].
			currentCharacter = $m
				ifTrue: [ 
					self step.
					currentCharacter = $m
						ifTrue: [ 
							self step.
							currentCharacter = $o
								ifTrue: [ 
									self step.
									currentCharacter = $n
										ifTrue: [ ^ self recordAndReportMatch: #(132) ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $n
				ifTrue: [ 
					self step.
					currentCharacter = $s
						ifTrue: [ 
							self step.
							currentCharacter = $t
								ifTrue: [ 
									self step.
									currentCharacter = $a
										ifTrue: [ 
											self step.
											currentCharacter = $n
												ifTrue: [ 
													self step.
													currentCharacter = $t
														ifTrue: [ 
															self recordMatch: #(86).
															self step.
															currentCharacter = $T
																ifTrue: [ 
																	self step.
																	currentCharacter = $y
																		ifTrue: [ 
																			self step.
																			currentCharacter = $p
																				ifTrue: [ 
																					self step.
																					currentCharacter = $e
																						ifTrue: [ ^ self recordAndReportMatch: #(66) ] ] ] ] ] ] ] ] ] ] ].
	^ self reportLastMatch