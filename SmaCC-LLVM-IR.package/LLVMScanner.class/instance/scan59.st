generated
scan59
	self step.
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(169) ].
	currentCharacter = $c
		ifTrue: [ 
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(169) ].
			currentCharacter = $m
				ifTrue: [ 
					self step.
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(169) ].
					currentCharacter = $p
						ifTrue: [ 
							self recordMatch: #(148).
							self step.
							currentCharacter = $:
								ifTrue: [ ^ self recordAndReportMatch: #(169) ].
							(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
								ifTrue: [ ^ self scan3 ].
							^ self reportLastMatch ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	currentCharacter = $n
		ifTrue: [ ^ self scan60 ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(168).
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(169) ].
			currentCharacter isDigit ] whileTrue ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch