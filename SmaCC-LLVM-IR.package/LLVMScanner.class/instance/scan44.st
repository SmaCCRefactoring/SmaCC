generated
scan44
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
							currentCharacter = $a
								ifTrue: [ 
									self step.
									currentCharacter = $s
										ifTrue: [ ^ self recordAndReportMatch: #(141) ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $b
		ifTrue: [ 
			self step.
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
														ifTrue: [ ^ self recordAndReportMatch: #(8) ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $c
		ifTrue: [ 
			self step.
			currentCharacter = $a
				ifTrue: [ 
					self step.
					currentCharacter = $p
						ifTrue: [ 
							self step.
							currentCharacter = $t
								ifTrue: [ 
									self step.
									currentCharacter = $u
										ifTrue: [ 
											self step.
											currentCharacter = $r
												ifTrue: [ 
													self step.
													currentCharacter = $e
														ifTrue: [ ^ self recordAndReportMatch: #(140) ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $d
		ifTrue: [ 
			self step.
			currentCharacter = $u
				ifTrue: [ 
					self step.
					currentCharacter = $p
						ifTrue: [ 
							self step.
							currentCharacter = $l
								ifTrue: [ 
									self step.
									currentCharacter = $i
										ifTrue: [ 
											self step.
											currentCharacter = $c
												ifTrue: [ 
													self step.
													currentCharacter = $a
														ifTrue: [ 
															self step.
															currentCharacter = $t
																ifTrue: [ 
																	self step.
																	currentCharacter = $e
																		ifTrue: [ ^ self recordAndReportMatch: #(5) ] ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $i
		ifTrue: [ ^ self scan45 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan46 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan47 ].
	currentCharacter = $u
		ifTrue: [ 
			self step.
			currentCharacter = $n
				ifTrue: [ 
					self step.
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
												ifTrue: [ ^ self recordAndReportMatch: #(6) ] ] ] ] ] ].
	^ self reportLastMatch