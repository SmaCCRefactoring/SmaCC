generated
scan14
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(247 262).
			self step.
			currentCharacter = $.
				ifTrue: [ 
					[ 
					self recordMatch: #(250).
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					currentCharacter isDigit ] whileTrue.
					('Ee' includes: currentCharacter)
						ifTrue: [ 
							self step.
							currentCharacter = $+
								ifTrue: [ ^ self scan12 ].
							currentCharacter = $-
								ifTrue: [ 
									self step.
									currentCharacter = $:
										ifTrue: [ ^ self recordAndReportMatch: #(258) ].
									currentCharacter isDigit
										ifTrue: [ ^ self scan15 ].
									(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
										ifTrue: [ ^ self scan5 ].
									^ self reportLastMatch ].
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(258) ].
							currentCharacter isDigit
								ifTrue: [ ^ self scan15 ] ].
					(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
						ifTrue: [ ^ self scan5 ].
					^ self reportLastMatch ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter isDigit ] whileTrue ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch