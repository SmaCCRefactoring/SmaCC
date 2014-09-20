generated
scan47
	self step.
	currentCharacter = $e
		ifTrue: [ 
			self step.
			currentCharacter = $d
				ifTrue: [ 
					self step.
					currentCharacter = $z
						ifTrue: [ 
							self step.
							currentCharacter = $o
								ifTrue: [ 
									self step.
									currentCharacter = $n
										ifTrue: [ 
											self step.
											currentCharacter = $e
												ifTrue: [ ^ self recordAndReportMatch: #(1) ] ] ] ].
					^ self reportLastMatch ].
			currentCharacter = $t
				ifTrue: [ 
					self step.
					currentCharacter = $u
						ifTrue: [ 
							self step.
							currentCharacter = $r
								ifTrue: [ 
									self step.
									currentCharacter = $n
										ifTrue: [ ^ self recordAndReportMatch: #(4) ] ] ] ] ].
	^ self reportLastMatch