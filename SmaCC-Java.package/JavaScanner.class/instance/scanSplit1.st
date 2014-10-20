generated
scanSplit1
	self recordMatch: #(98).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan4 ].
	(currentCharacter between: $8 and: $9)
		ifTrue: [ ^ self scan8 ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(98).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan4 ].
			(currentCharacter between: $8 and: $9)
				ifTrue: [ ^ self scan8 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan5 ].
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(98) ].
			('DFdf' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(99) ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan5 ].
	('Ll' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(98) ].
	('Xx' includes: currentCharacter)
		ifTrue: [ 
			self step.
			currentCharacter isHexDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(98).
					self step.
					currentCharacter = $.
						ifTrue: [ 
							self step.
							currentCharacter isHexDigit
								ifTrue: [ 
									[ 
									self step.
									('Pp' includes: currentCharacter)
										ifTrue: [ ^ self scan5 ].
									currentCharacter isHexDigit ] whileTrue ].
							^ self reportLastMatch ].
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(98) ].
					currentCharacter isHexDigit ] whileTrue ].
			^ self reportLastMatch ].
	('DFdf' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(99) ].
	^ self reportLastMatch