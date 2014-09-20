generated
scan60
	self step.
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $l
						ifTrue: [ ^ self recordAndReportMatch: #(228) ].
					^ self reportLastMatch ].
			currentCharacter = $r
				ifTrue: [ 
					self step.
					currentCharacter = $g
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $t
										ifTrue: [ ^ self recordAndReportMatch: #(83) ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $h
		ifTrue: [ 
			self step.
			currentCharacter = $r
				ifTrue: [ 
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
											currentCharacter = $_
												ifTrue: [ 
													self step.
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
																				ifTrue: [ 
																					self step.
																					currentCharacter = $l
																						ifTrue: [ ^ self recordAndReportMatch: #(102) ] ] ] ].
															^ self reportLastMatch ].
													currentCharacter = $s
														ifTrue: [ 
															self step.
															currentCharacter = $a
																ifTrue: [ 
																	self step.
																	currentCharacter = $f
																		ifTrue: [ 
																			self step.
																			currentCharacter = $e
																				ifTrue: [ 
																					self step.
																					currentCharacter = $t
																						ifTrue: [ 
																							self step.
																							currentCharacter = $y
																								ifTrue: [ ^ self recordAndReportMatch: #(47) ] ] ] ] ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $o
		ifTrue: [ ^ self recordAndReportMatch: #(69) ].
	currentCharacter = $r
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $p
						ifTrue: [ 
							self step.
							currentCharacter = $l
								ifTrue: [ 
									self step.
									currentCharacter = $e
										ifTrue: [ ^ self recordAndReportMatch: #(90) ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $u
				ifTrue: [ 
					self step.
					currentCharacter = $n
						ifTrue: [ 
							self step.
							currentCharacter = $c
								ifTrue: [ ^ self recordAndReportMatch: #(209) ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $y
		ifTrue: [ 
			self step.
			currentCharacter = $p
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ ^ self recordAndReportMatch: #(151) ] ] ].
	^ self reportLastMatch