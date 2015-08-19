generated
scanSplitSeq2
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(19) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(44).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(57) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(93).
			self step.
			currentCharacter = $+
				ifTrue: [ ^ self recordAndReportMatch: #(92) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(68) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(4) ].
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
					self recordMatch: #(106).
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
		ifTrue: [ ^ self scan8 ].
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