generated
scanSplit17
	self recordMatch: #(73).
	self step.
	currentCharacter = $.
		ifTrue: [ ^ self scan9 ].
	(currentCharacter between: $8 and: $9)
		ifTrue: [ ^ self scan12 ].
	currentCharacter isDigit
		ifTrue: [ 
			[ 
			self recordMatch: #(73).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan9 ].
			(currentCharacter between: $8 and: $9)
				ifTrue: [ ^ self scan12 ].
			currentCharacter isDigit ] whileTrue.
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan10 ].
			('Ljl' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(73) ].
			^ self reportLastMatch ].
	('Bb' includes: currentCharacter)
		ifTrue: [ 
			self step.
			(currentCharacter between: $0 and: $1)
				ifTrue: [ 
					[ 
					self recordMatch: #(73).
					self step.
					currentCharacter between: $0 and: $1 ] whileTrue.
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(73) ] ].
			^ self reportLastMatch ].
	('Ee' includes: currentCharacter)
		ifTrue: [ ^ self scan10 ].
	('Oo' includes: currentCharacter)
		ifTrue: [ 
			self step.
			(currentCharacter between: $0 and: $7)
				ifTrue: [ 
					[ 
					self recordMatch: #(73).
					self step.
					currentCharacter between: $0 and: $7 ] whileTrue.
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(73) ] ].
			^ self reportLastMatch ].
	('Xx' includes: currentCharacter)
		ifTrue: [ 
			self step.
			currentCharacter isHexDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(73).
					self step.
					('Ll' includes: currentCharacter)
						ifTrue: [ ^ self recordAndReportMatch: #(73) ].
					currentCharacter isHexDigit ] whileTrue ].
			^ self reportLastMatch ].
	('Ljl' includes: currentCharacter)
		ifTrue: [ ^ self recordAndReportMatch: #(73) ].
	^ self reportLastMatch