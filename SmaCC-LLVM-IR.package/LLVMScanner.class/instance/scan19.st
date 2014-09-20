generated
scan19
	self step.
	currentCharacter = $c
		ifTrue: [ 
			self step.
			currentCharacter = $q
				ifTrue: [ 
					self step.
					currentCharacter = $_
						ifTrue: [ 
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self step.
									currentCharacter = $e
										ifTrue: [ 
											self step.
											currentCharacter = $l
												ifTrue: [ ^ self recordAndReportMatch: #(185) ] ] ].
							^ self reportLastMatch ].
					currentCharacter = $u
						ifTrue: [ 
							self step.
							currentCharacter = $i
								ifTrue: [ 
									self step.
									currentCharacter = $r
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ ^ self recordAndReportMatch: #(225) ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $d
		ifTrue: [ ^ self scan20 ].
	currentCharacter = $l
		ifTrue: [ ^ self scan21 ].
	currentCharacter = $n
		ifTrue: [ 
			self step.
			currentCharacter = $d
				ifTrue: [ ^ self recordAndReportMatch: #(100) ].
			currentCharacter = $y
				ifTrue: [ 
					self step.
					currentCharacter = $r
						ifTrue: [ 
							self step.
							currentCharacter = $e
								ifTrue: [ 
									self step.
									currentCharacter = $g
										ifTrue: [ 
											2
												timesRepeat: [ 
													self step.
													currentCharacter = $c
														ifFalse: [ ^ self reportLastMatch ] ].
											^ self recordAndReportMatch: #(182) ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $p
		ifTrue: [ 
			self step.
			currentCharacter = $p
				ifTrue: [ 
					self step.
					currentCharacter = $e
						ifTrue: [ 
							self step.
							currentCharacter = $n
								ifTrue: [ 
									self step.
									currentCharacter = $d
										ifTrue: [ 
											self step.
											currentCharacter = $i
												ifTrue: [ 
													self step.
													currentCharacter = $n
														ifTrue: [ 
															self step.
															currentCharacter = $g
																ifTrue: [ ^ self recordAndReportMatch: #(150) ] ] ] ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $r
		ifTrue: [ ^ self scan22 ].
	currentCharacter = $s
		ifTrue: [ 
			self step.
			currentCharacter = $h
				ifTrue: [ 
					self step.
					currentCharacter = $r
						ifTrue: [ ^ self recordAndReportMatch: #(122) ].
					^ self reportLastMatch ].
			currentCharacter = $m
				ifTrue: [ ^ self recordAndReportMatch: #(88) ].
			^ self reportLastMatch ].
	currentCharacter = $t
		ifTrue: [ ^ self scan23 ].
	currentCharacter = $v
		ifTrue: [ ^ self scan24 ].
	^ self reportLastMatch