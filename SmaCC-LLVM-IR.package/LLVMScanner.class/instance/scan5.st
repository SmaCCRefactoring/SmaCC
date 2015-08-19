generated
scan5
	[ 
	self recordMatch: #(246 261).
	self step.
	currentCharacter = $.
		ifTrue: [ 
			[ 
			self recordMatch: #(249).
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ 
					self step.
					currentCharacter = $+
						ifTrue: [ ^ self scan3 ].
					currentCharacter = $-
						ifTrue: [ self step ].
					currentCharacter = $:
						ifTrue: [ ^ self recordAndReportMatch: #(257) ].
					currentCharacter isDigit
						ifTrue: [ ^ self scan6 ] ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan1 ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	currentCharacter isDigit ] whileTrue.
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch