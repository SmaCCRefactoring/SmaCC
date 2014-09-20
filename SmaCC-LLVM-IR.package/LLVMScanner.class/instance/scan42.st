generated
scan42
	self step.
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $x
				ifTrue: [ ^ self recordAndReportMatch: #(213) ].
			^ self reportLastMatch ].
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $d
								ifTrue: [ 
									self step.
									currentCharacter = $a
										ifTrue: [ 
											self step.
											currentCharacter = $t
												ifTrue: [ 
													self step.
													currentCharacter = $a
														ifTrue: [ ^ self recordAndReportMatch: #(78) ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $i
		ifTrue: [ 
			self step.
			currentCharacter = $n
				ifTrue: [ ^ self recordAndReportMatch: #(215) ].
			^ self reportLastMatch ].
	currentCharacter = $o
		ifTrue: [ 
			self step.
			currentCharacter = $d
				ifTrue: [ 
					self step.
					currentCharacter = $u
						ifTrue: [ 
							self step.
							currentCharacter = $l
								ifTrue: [ 
									self step.
									currentCharacter = $e
										ifTrue: [ ^ self recordAndReportMatch: #(92) ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $n
				ifTrue: [ 
					self step.
					currentCharacter = $o
						ifTrue: [ 
							self step.
							currentCharacter = $t
								ifTrue: [ 
									self step.
									currentCharacter = $o
										ifTrue: [ 
											self step.
											currentCharacter = $n
												ifTrue: [ 
													self step.
													currentCharacter = $i
														ifTrue: [ 
															self step.
															currentCharacter = $c
																ifTrue: [ ^ self recordAndReportMatch: #(226) ] ] ] ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $v
				ifTrue: [ ^ self recordAndReportMatch: #(153) ].
			^ self reportLastMatch ].
	currentCharacter = $s
		ifTrue: [ 
			self step.
			currentCharacter = $p
				ifTrue: [ 
					self step.
					currentCharacter = $4
						ifTrue: [ 
							self step.
							currentCharacter = $3
								ifTrue: [ 
									self step.
									currentCharacter = $0
										ifTrue: [ 
											self step.
											currentCharacter = $_
												ifTrue: [ 
													self step.
													currentCharacter = $i
														ifTrue: [ 
															self step.
															currentCharacter = $n
																ifTrue: [ 
																	self step.
																	currentCharacter = $t
																		ifTrue: [ 
																			self step.
																			currentCharacter = $r
																				ifTrue: [ 
																					2
																						timesRepeat: [ 
																							self step.
																							currentCharacter = $c
																								ifFalse: [ ^ self reportLastMatch ] ].
																					^ self recordAndReportMatch: #(156) ] ] ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $u
		ifTrue: [ 
			self step.
			currentCharacter = $l
				ifTrue: [ ^ self recordAndReportMatch: #(113) ] ].
	^ self reportLastMatch