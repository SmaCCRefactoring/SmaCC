generated
scan51
	self step.
	currentCharacter = $r
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $o
						ifTrue: [ 
							self step.
							currentCharacter = $i
								ifTrue: [ 
									self step.
									currentCharacter = $n
										ifTrue: [ 
											self step.
											currentCharacter = $t
												ifTrue: [ ^ self recordAndReportMatch: #(191) ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $x
		ifTrue: [ 
			self step.
			currentCharacter = $_
				ifTrue: [ 
					self step.
					currentCharacter = $d
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $v
										ifTrue: [ 
											self step.
											currentCharacter = $i
												ifTrue: [ 
													self step.
													currentCharacter = $c
														ifTrue: [ 
															self step.
															currentCharacter = $e
																ifTrue: [ ^ self recordAndReportMatch: #(158) ] ] ] ] ].
							^ self reportLastMatch ].
					currentCharacter = $k
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $r
										ifTrue: [ 
											self step.
											currentCharacter = $n
												ifTrue: [ 
													self step.
													currentCharacter = $e
														ifTrue: [ 
															self step.
															currentCharacter = $l
																ifTrue: [ ^ self recordAndReportMatch: #(155) ] ] ] ] ] ] ] ].
	^ self reportLastMatch