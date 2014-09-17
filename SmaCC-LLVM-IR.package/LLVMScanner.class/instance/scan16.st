generated
scan16
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan13 ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(170) ].
	currentCharacter = $x
		ifTrue: [ 
			self step.
			(currentCharacter between: $K and: $M)
				ifTrue: [ self step ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(170) ].
			currentCharacter isHexDigit
				ifTrue: [ ^ self scan17 ].
			(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan13 ].
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(170) ].
			currentCharacter isDigit ] whileTrue ].
	(currentCharacter isSafeForHTTP or: [ currentCharacter = $$ ])
		ifTrue: [ ^ self scan4 ].
	^ self reportLastMatch