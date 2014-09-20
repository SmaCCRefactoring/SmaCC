generated
scan69
	self step.
	currentCharacter = $6
		ifTrue: [ ^ self scan70 ].
	currentCharacter = $f
		ifTrue: [ 
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $s
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
													2
														timesRepeat: [ 
															self step.
															currentCharacter = $l
																ifFalse: [ ^ self reportLastMatch ] ].
													2
														timesRepeat: [ 
															self step.
															currentCharacter = $c
																ifFalse: [ ^ self reportLastMatch ] ].
													^ self recordAndReportMatch: #(166) ] ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $p
				ifTrue: [ 
					self step.
					currentCharacter = $8
						ifTrue: [ 
							self step.
							currentCharacter = $0
								ifTrue: [ ^ self recordAndReportMatch: #(126) ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $m
		ifTrue: [ 
			self step.
			currentCharacter = $m
				ifTrue: [ 
					self step.
					currentCharacter = $x
						ifTrue: [ ^ self recordAndReportMatch: #(147) ] ].
			^ self reportLastMatch ].
	currentCharacter = $s
		ifTrue: [ 
			self step.
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $d
						ifTrue: [ 
							self step.
							currentCharacter = $c
								ifTrue: [ 
									self step.
									currentCharacter = $a
										ifTrue: [ 
											2
												timesRepeat: [ 
													self step.
													currentCharacter = $l
														ifFalse: [ ^ self reportLastMatch ] ].
											2
												timesRepeat: [ 
													self step.
													currentCharacter = $c
														ifFalse: [ ^ self reportLastMatch ] ].
											^ self recordAndReportMatch: #(178) ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $t
		ifTrue: [ 
			self step.
			currentCharacter = $h
				ifTrue: [ 
					self step.
					currentCharacter = $i
						ifTrue: [ 
							self step.
							currentCharacter = $s
								ifTrue: [ 
									self step.
									currentCharacter = $c
										ifTrue: [ 
											self step.
											currentCharacter = $a
												ifTrue: [ 
													2
														timesRepeat: [ 
															self step.
															currentCharacter = $l
																ifFalse: [ ^ self reportLastMatch ] ].
													2
														timesRepeat: [ 
															self step.
															currentCharacter = $c
																ifFalse: [ ^ self reportLastMatch ] ].
													^ self recordAndReportMatch: #(162) ] ] ] ] ] ].
	^ self reportLastMatch