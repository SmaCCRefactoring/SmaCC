generated
scanForToken
	self step.
	currentCharacter = $!
		ifTrue: [ 
			self recordMatch: #(88).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(58) ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(89).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(67) ].
			^ self reportLastMatch ].
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(66).
			self step.
			currentCharacter = $&
				ifTrue: [ ^ self recordAndReportMatch: #(50) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(61) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ 
			self step.
			currentCharacter = $\
				ifTrue: [ 
					self step.
					currentCharacter = $u
						ifTrue: [ 
							self step.
							currentCharacter isHexDigit
								ifTrue: [ 
									3
										timesRepeat: [ 
											self step.
											currentCharacter isHexDigit
												ifFalse: [ ^ self reportLastMatch ] ].
									^ self scan2 ].
							^ self reportLastMatch ].
					(currentCharacter between: $0 and: $3)
						ifTrue: [ 
							self step.
							currentCharacter = $'
								ifTrue: [ ^ self recordAndReportMatch: #(101) ].
							(currentCharacter between: $0 and: $7)
								ifTrue: [ ^ self scan3 ].
							^ self reportLastMatch ].
					(currentCharacter between: $4 and: $7)
						ifTrue: [ ^ self scan3 ].
					('"''\bfnrt' includes: currentCharacter)
						ifTrue: [ ^ self scan2 ].
					^ self reportLastMatch ].
			(currentCharacter <= $& or: [ (currentCharacter between: $( and: $[) or: [ currentCharacter >= $] ] ])
				ifTrue: [ ^ self scan2 ].
			^ self reportLastMatch ].
	^ self scanSplitSeq2