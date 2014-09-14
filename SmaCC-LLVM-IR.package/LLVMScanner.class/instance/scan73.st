generated
scan73
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(169) ].
	currentCharacter = $a
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(169) ].
			currentCharacter = $q
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(169) ].
					currentCharacter = $u
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(169) ].
							currentCharacter = $e
								ifTrue: [ 
									self recordMatch: #(127).
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(169) ] ].
							(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
								ifTrue: [ ^ self scan3 ].
							^ self reportLastMatch ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	currentCharacter = $t
		ifTrue: [ ^ self scan74 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch