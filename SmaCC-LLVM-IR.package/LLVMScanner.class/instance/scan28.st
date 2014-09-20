generated
scan28
	self step.
	currentCharacter = $l
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self step.
					currentCharacter = $x
						ifTrue: [ 
							self step.
							currentCharacter = $p
								ifTrue: [ 
									self step.
									currentCharacter = $o
										ifTrue: [ 
											self step.
											currentCharacter = $r
												ifTrue: [ 
													self step.
													currentCharacter = $t
														ifTrue: [ ^ self recordAndReportMatch: #(171) ] ] ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $m
						ifTrue: [ 
							self step.
							currentCharacter = $p
								ifTrue: [ 
									self step.
									currentCharacter = $o
										ifTrue: [ 
											self step.
											currentCharacter = $r
												ifTrue: [ 
													self step.
													currentCharacter = $t
														ifTrue: [ ^ self recordAndReportMatch: #(172) ] ] ] ] ] ] ].
	^ self reportLastMatch