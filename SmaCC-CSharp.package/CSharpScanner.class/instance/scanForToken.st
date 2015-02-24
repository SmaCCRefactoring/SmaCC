generated
scanForToken
	self step.
	currentCharacter = $!
		ifTrue: [ 
			self recordMatch: #(9).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(33) ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $#
		ifTrue: [ 
			[ 
			self recordMatch: #(160).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(4).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(119) ].
			^ self reportLastMatch ].
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $&
				ifTrue: [ ^ self recordAndReportMatch: #(31) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(116) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ 
			self step.
			currentCharacter = $\
				ifTrue: [ 
					self step.
					currentCharacter = $x
						ifTrue: [ 
							self step.
							currentCharacter isHexDigit
								ifTrue: [ 
									3
										timesRepeat: [ 
											self step.
											currentCharacter = $'
												ifTrue: [ ^ self recordAndReportMatch: #(157) ].
											currentCharacter isHexDigit
												ifFalse: [ ^ self reportLastMatch ] ].
									^ self scan3 ].
							^ self reportLastMatch ].
					('Uu' includes: currentCharacter)
						ifTrue: [ 
							self step.
							currentCharacter isHexDigit
								ifTrue: [ 
									3
										timesRepeat: [ 
											self step.
											currentCharacter isHexDigit
												ifFalse: [ ^ self reportLastMatch ] ].
									self step.
									currentCharacter = $'
										ifTrue: [ ^ self recordAndReportMatch: #(157) ].
									currentCharacter isHexDigit
										ifTrue: [ 
											3
												timesRepeat: [ 
													self step.
													currentCharacter isHexDigit
														ifFalse: [ ^ self reportLastMatch ] ].
											^ self scan3 ] ].
							^ self reportLastMatch ].
					(('"''0\' includes: currentCharacter)
						or: [ (currentCharacter between: $a and: $b) or: [ 'fnrtv' includes: currentCharacter ] ])
						ifTrue: [ ^ self scan3 ].
					^ self reportLastMatch ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: $&)
						or: [ (currentCharacter between: $( and: $[) or: [ currentCharacter >= $] ] ] ])
				ifTrue: [ ^ self scan3 ].
			^ self reportLastMatch ].
	^ self scanSplitSeq2