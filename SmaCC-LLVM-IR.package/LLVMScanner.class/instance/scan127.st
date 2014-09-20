generated
scan127
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			currentCharacter = $l
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ].
					currentCharacter = $i
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(257) ].
							currentCharacter = $a
								ifTrue: [ 
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(257) ].
									currentCharacter = $s
										ifTrue: [ 
											self recordMatch: #(140).
											self step.
											currentCharacter = $:
												ifTrue: [ ^ self recordAndReportMatch: #(257) ].
											(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
												ifTrue: [ ^ self scan5 ].
											^ self reportLastMatch ] ].
							(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
								ifTrue: [ ^ self scan5 ].
							^ self reportLastMatch ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $b
		ifTrue: [ ^ self scan128 ].
	currentCharacter = $c
		ifTrue: [ ^ self scan129 ].
	currentCharacter = $d
		ifTrue: [ ^ self scan130 ].
	currentCharacter = $i
		ifTrue: [ ^ self scan131 ].
	currentCharacter = $n
		ifTrue: [ ^ self scan133 ].
	currentCharacter = $r
		ifTrue: [ ^ self scan134 ].
	currentCharacter = $u
		ifTrue: [ ^ self scan135 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch