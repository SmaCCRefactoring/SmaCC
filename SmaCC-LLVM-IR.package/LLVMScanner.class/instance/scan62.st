generated
scan62
	self step.
	currentCharacter = $d
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self step.
					currentCharacter = $f
						ifTrue: [ ^ self recordAndReportMatch: #(94) ] ].
			^ self reportLastMatch ].
	currentCharacter = $e
		ifTrue: [ ^ self recordAndReportMatch: #(240) ].
	currentCharacter = $i
		ifTrue: [ ^ self scan63 ].
	currentCharacter = $n
		ifTrue: [ 
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $m
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $d
										ifTrue: [ 
											self step.
											currentCharacter = $_
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
																ifTrue: [ ^ self recordAndReportMatch: #(87) ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $o
		ifTrue: [ 
			self recordMatch: #(235).
			self step.
			currentCharacter = $r
				ifTrue: [ 
					self step.
					currentCharacter = $d
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $r
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ 
													self step.
													currentCharacter = $d
														ifTrue: [ ^ self recordAndReportMatch: #(227) ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $r
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $c
								ifTrue: [ 
									self step.
									currentCharacter = $h
										ifTrue: [ 
											self step.
											currentCharacter = $a
												ifTrue: [ 
													self step.
													currentCharacter = $b
														ifTrue: [ 
															self step.
															currentCharacter = $l
																ifTrue: [ 
																	self step.
																	currentCharacter = $e
																		ifTrue: [ ^ self recordAndReportMatch: #(33) ] ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $w
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $n
						ifTrue: [ 
							self step.
							currentCharacter = $d
								ifTrue: [ ^ self recordAndReportMatch: #(38) ] ] ] ].
	^ self reportLastMatch