generated
scan84
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(258) ].
	currentCharacter = $c
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter = $m
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(258) ].
					currentCharacter = $p
						ifTrue: [ 
							self recordMatch: #(76).
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(258) ].
							(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
								ifTrue: [ ^ self scan5 ].
							^ self reportLastMatch ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan5 ].
			^ self reportLastMatch ].
	currentCharacter = $n
		ifTrue: [ ^ self scan85 ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(255).
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(258) ].
			currentCharacter isDigit ] whileTrue ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch