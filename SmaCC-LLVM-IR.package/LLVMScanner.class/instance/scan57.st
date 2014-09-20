generated
scan57
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter = $l
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $d
				ifTrue: [ 
					self recordMatch: #(25).
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					currentCharacter = $c
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(258) ].
							currentCharacter = $c
								ifTrue: [ 
									self recordMatch: #(175).
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(258) ] ].
							(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
								ifTrue: [ ^ self scan5 ].
							^ self reportLastMatch ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $m
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $m
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					currentCharacter = $o
						ifTrue: [ 
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(258) ].
							currentCharacter = $n
								ifTrue: [ 
									self recordMatch: #(132).
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(258) ] ].
							(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
								ifTrue: [ ^ self scan5 ].
							^ self reportLastMatch ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $n
		ifTrue: [ ^ self scan58 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch