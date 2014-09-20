generated
scan21
	self step.
	currentCharacter = $i
		ifTrue: [ 
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $s
						ifTrue: [ ^ self recordAndReportMatch: #(81) ].
					^ self reportLastMatch ].
			currentCharacter = $g
				ifTrue: [ 
					self step.
					currentCharacter = $n
						ifTrue: [ 
							self recordMatch: #(18).
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
													currentCharacter = $c
														ifTrue: [ 
															self step.
															currentCharacter = $k
																ifTrue: [ ^ self recordAndReportMatch: #(28) ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $l
		ifTrue: [ 
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self step.
					currentCharacter = $c
						ifTrue: [ 
							self step.
							currentCharacter = $a
								ifTrue: [ ^ self recordAndReportMatch: #(42) ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $w
		ifTrue: [ 
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $y
						ifTrue: [ 
							self step.
							currentCharacter = $s
								ifTrue: [ 
									self step.
									currentCharacter = $i
										ifTrue: [ 
											self step.
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
																				ifTrue: [ ^ self recordAndReportMatch: #(30) ] ] ] ] ] ] ] ] ] ].
	^ self reportLastMatch