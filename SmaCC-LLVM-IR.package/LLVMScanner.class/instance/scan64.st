generated
scan64
	self step.
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $_
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self step.
									currentCharacter = $g
										ifTrue: [ ^ self recordAndReportMatch: #(217) ] ] ] ].
			^ self reportLastMatch ].
	currentCharacter = $o
		ifTrue: [ 
			self step.
			currentCharacter = $i
				ifTrue: [ 
					self step.
					currentCharacter = $d
						ifTrue: [ ^ self recordAndReportMatch: #(60) ].
					^ self reportLastMatch ].
			currentCharacter = $l
				ifTrue: [ 
					self step.
					currentCharacter = $a
						ifTrue: [ 
							self step.
							currentCharacter = $t
								ifTrue: [ 
									self step.
									currentCharacter = $i
										ifTrue: [ 
											self step.
											currentCharacter = $l
												ifTrue: [ 
													self step.
													currentCharacter = $e
														ifTrue: [ ^ self recordAndReportMatch: #(93) ] ] ] ] ] ] ].
	^ self reportLastMatch