generated
scanSplitSeq2
	currentCharacter = $0
		ifTrue: [ 
			self recordMatch: #(73).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan10 ].
			(currentCharacter between: $8 and: $9)
				ifTrue: [ ^ self scan13 ].
			currentCharacter isDigit
				ifTrue: [ 
					[ 
					self recordMatch: #(73).
					self step.
					currentCharacter = $.
						ifTrue: [ ^ self scan10 ].
					(currentCharacter between: $8 and: $9)
						ifTrue: [ ^ self scan13 ].
					currentCharacter isDigit ] whileTrue.
					('Ee' includes: currentCharacter)
						ifTrue: [ ^ self scan11 ].
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
				ifTrue: [ ^ self scan11 ].
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
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter = $;
		ifTrue: [ ^ self recordAndReportMatch: #(26) ].
	currentCharacter = $<
		ifTrue: [ 
			self recordMatch: #(66).
			self step.
			currentCharacter = $<
				ifTrue: [ 
					self recordMatch: #(43).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(16) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(45) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(52) ].
			^ self reportLastMatch ].
	currentCharacter = $=
		ifTrue: [ 
			self recordMatch: #(25).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(56) ].
			^ self reportLastMatch ].
	currentCharacter = $>
		ifTrue: [ 
			self recordMatch: #(65).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(54) ].
			currentCharacter = $>
				ifTrue: [ 
					self recordMatch: #(4).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(9) ] ].
			^ self reportLastMatch ].
	^ self scanSplitSeq1