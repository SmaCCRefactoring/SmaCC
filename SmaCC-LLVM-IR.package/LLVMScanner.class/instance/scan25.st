generated
scan25
	self step.
	currentCharacter = $i
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $c
						ifTrue: [ 
							self step.
							currentCharacter = $a
								ifTrue: [ 
									self step.
									currentCharacter = $s
										ifTrue: [ 
											self step.
											currentCharacter = $t
												ifTrue: [ ^ self recordAndReportMatch: #(198) ] ] ] ] ].
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
							currentCharacter = $k
								ifTrue: [ 
									self step.
									currentCharacter = $a
										ifTrue: [ 
											2
												timesRepeat: [ 
													self step.
													currentCharacter = $d
														ifFalse: [ ^ self reportLastMatch ] ].
											self step.
											currentCharacter = $r
												ifTrue: [ 
													self step.
													currentCharacter = $e
														ifTrue: [ 
															2
																timesRepeat: [ 
																	self step.
																	currentCharacter = $s
																		ifFalse: [ ^ self reportLastMatch ] ].
															^ self recordAndReportMatch: #(97) ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $r
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	currentCharacter = $u
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $l
						ifTrue: [ 
							self step.
							currentCharacter = $t
								ifTrue: [ 
									self step.
									currentCharacter = $i
										ifTrue: [ 
											self step.
											currentCharacter = $n
												ifTrue: [ ^ self recordAndReportMatch: #(26) ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $y
		ifTrue: [ 
			self step.
			currentCharacter = $v
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $l
								ifTrue: [ ^ self recordAndReportMatch: #(143) ] ] ] ].
	^ self reportLastMatch