generated
scan59
	self step.
	currentCharacter = $p
		ifTrue: [ 
			self recordMatch: #(54).
			self step.
			currentCharacter = $r
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $q
								ifTrue: [ ^ self recordAndReportMatch: #(51) ] ].
					^ self reportLastMatch ].
			currentCharacter = $s
				ifTrue: [ 
					self step.
					currentCharacter = $t
						ifTrue: [ 
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self step.
									currentCharacter = $o
										ifTrue: [ 
											self step.
											currentCharacter = $n
												ifTrue: [ 
													self step.
													currentCharacter = $g
														ifTrue: [ ^ self recordAndReportMatch: #(53) ] ] ] ] ] ] ].
	^ self reportLastMatch