generated
scan36
	self step.
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $l
				ifTrue: [ 
					self step.
					currentCharacter = $l
						ifTrue: [ 
							self step.
							currentCharacter = $o
								ifTrue: [ 
									self step.
									currentCharacter = $c
										ifTrue: [ 
											self step.
											currentCharacter = $a
												ifTrue: [ ^ self recordAndReportMatch: #(144) ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $b
		ifTrue: [ 
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self step.
					currentCharacter = $u
						ifTrue: [ 
							self step.
							currentCharacter = $n
								ifTrue: [ 
									self step.
									currentCharacter = $d
										ifTrue: [ 
											self step.
											currentCharacter = $s
												ifTrue: [ ^ self recordAndReportMatch: #(63) ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $d
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $r
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $c
										ifTrue: [ 
											self step.
											currentCharacter = $t
												ifTrue: [ 
													self step.
													currentCharacter = $b
														ifTrue: [ 
															self step.
															currentCharacter = $r
																ifTrue: [ ^ self recordAndReportMatch: #(56) ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $i
		ifTrue: [ ^ self scan37 ].
	currentCharacter = $l
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $n
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $h
										ifTrue: [ 
											self step.
											currentCharacter = $i
												ifTrue: [ 
													self step.
													currentCharacter = $n
														ifTrue: [ 
															self step.
															currentCharacter = $t
																ifTrue: [ ^ self recordAndReportMatch: #(24) ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $r
		ifTrue: [ 
			self step.
			currentCharacter = $e
				ifTrue: [ 
					self step.
					currentCharacter = $g
						ifTrue: [ ^ self recordAndReportMatch: #(36) ] ].
			^ self reportLastMatch ].
	currentCharacter = $s
		ifTrue: [ ^ self scan38 ].
	currentCharacter = $t
		ifTrue: [ ^ self scan39 ].
	currentCharacter = $v
		ifTrue: [ 
			self step.
			currentCharacter = $o
				ifTrue: [ 
					self step.
					currentCharacter = $k
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ ^ self recordAndReportMatch: #(55) ] ] ] ].
	^ self reportLastMatch