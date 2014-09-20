generated
scan27
	self step.
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $l
								ifTrue: [ 
									self step.
									currentCharacter = $a
										ifTrue: [ 
											self step.
											currentCharacter = $y
												ifTrue: [ 
													self step.
													currentCharacter = $o
														ifTrue: [ 
															self step.
															currentCharacter = $u
																ifTrue: [ 
																	self step.
																	currentCharacter = $t
																		ifTrue: [ ^ self recordAndReportMatch: #(91) ] ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $c
				ifTrue: [ 
					self step.
					currentCharacter = $l
						ifTrue: [ 
							self step.
							currentCharacter = $a
								ifTrue: [ 
									self step.
									currentCharacter = $r
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ ^ self recordAndReportMatch: #(19) ] ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $f
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $u
								ifTrue: [ 
									self step.
									currentCharacter = $l
										ifTrue: [ 
											self step.
											currentCharacter = $t
												ifTrue: [ ^ self recordAndReportMatch: #(164) ] ] ].
							^ self reportLastMatch ].
					currentCharacter = $i
						ifTrue: [ 
							self step.
							currentCharacter = $n
								ifTrue: [ 
									self step.
									currentCharacter = $e
										ifTrue: [ ^ self recordAndReportMatch: #(16) ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $l
		ifTrue: [ ^ self scan28 ].
	currentCharacter = $o
		ifTrue: [ 
			self step.
			currentCharacter = $u
				ifTrue: [ 
					self step.
					currentCharacter = $b
						ifTrue: [ 
							self step.
							currentCharacter = $l
								ifTrue: [ 
									self step.
									currentCharacter = $e
										ifTrue: [ ^ self recordAndReportMatch: #(128) ] ] ] ] ].
	^ self reportLastMatch