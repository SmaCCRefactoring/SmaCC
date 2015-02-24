generated
scanSplitSeq2
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(90).
			self step.
			currentCharacter = $-
				ifTrue: [ ^ self recordAndReportMatch: #(94) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(71) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(85) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(30).
			self step.
			currentCharacter = $.
				ifTrue: [ 
					self step.
					currentCharacter = $.
						ifTrue: [ ^ self recordAndReportMatch: #(20) ].
					^ self reportLastMatch ].
			currentCharacter isDigit
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(86).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan7 ].
			currentCharacter = $/
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(106) ].
					currentCharacter = Character cr
						ifTrue: [ 
							self recordMatch: #(106).
							self step.
							currentCharacter = Character lf
								ifTrue: [ ^ self recordAndReportMatch: #(106) ].
							^ self reportLastMatch ] ] repeat ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(69) ].
			^ self reportLastMatch ].
	currentCharacter = $0
		ifTrue: [ 
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
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(17) ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(45) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(72).
			self step.
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(76).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(70) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(60) ].
			^ self reportLastMatch ].
	^ self scanSplitSeq1