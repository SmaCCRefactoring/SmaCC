generated
scan15
	self recordMatch: #(162).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan12 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(169) ].
	currentCharacter = $x
		ifTrue: [ 
			self step.
			(currentCharacter between: $K and: $M)
				ifTrue: [ self step ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(169) ].
			currentCharacter isHexDigit
				ifTrue: [ ^ self scan17 ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ ^ self scan16 ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan3 ].
	^ self reportLastMatch