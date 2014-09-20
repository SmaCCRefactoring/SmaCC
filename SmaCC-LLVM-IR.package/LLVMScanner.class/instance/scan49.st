generated
scan49
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $r
				ifTrue: [ 
					self step.
					currentCharacter = $s
						ifTrue: [ 
							self step.
							currentCharacter = $o
								ifTrue: [ 
									self step.
									currentCharacter = $n
										ifTrue: [ 
											self step.
											currentCharacter = $a
												ifTrue: [ 
													self step.
													currentCharacter = $l
														ifTrue: [ 
															self step.
															currentCharacter = $i
																ifTrue: [ 
																	self step.
																	currentCharacter = $t
																		ifTrue: [ 
																			self step.
																			currentCharacter = $y
																				ifTrue: [ ^ self recordAndReportMatch: #(222) ] ] ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $h
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ ^ self recordAndReportMatch: #(224) ].
			^ self reportLastMatch ].
	currentCharacter = $p
		ifTrue: [ 
			self step.
			currentCharacter = $c
				ifTrue: [ 
					self step.
					currentCharacter = $_
						ifTrue: [ 
							self step.
							currentCharacter = $f
								ifTrue: [ 
									self step.
									currentCharacter = $p
										ifTrue: [ 
											self step.
											currentCharacter = $1
												ifTrue: [ 
													self step.
													currentCharacter = $2
														ifTrue: [ 
															self step.
															currentCharacter = $8
																ifTrue: [ ^ self recordAndReportMatch: #(125) ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $r
		ifTrue: [ ^ self scan50 ].
	currentCharacter = $t
		ifTrue: [ ^ self scan51 ].
	^ self reportLastMatch