generated
scanSplitSeq2
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(65) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(2).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(129) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(16).
			self step.
			currentCharacter = $+
				ifTrue: [ ^ self recordAndReportMatch: #(37) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(131) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(59) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(15).
			self step.
			currentCharacter = $-
				ifTrue: [ ^ self recordAndReportMatch: #(19) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(130) ].
			currentCharacter = $>
				ifTrue: [ ^ self recordAndReportMatch: #(98) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(48).
			self step.
			currentCharacter isDigit
				ifTrue: [ ^ self scan4 ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(1).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan7 ].
			currentCharacter = $/
				ifTrue: [ 
					[ 
					self recordMatch: #(153).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(123) ].
			^ self reportLastMatch ].
	currentCharacter = $0
		ifTrue: [ 
			self recordMatch: #(155 156).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan8 ].
			currentCharacter isDigit
				ifTrue: [ ^ self scan9 ].
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan5 ].
			('Ll' includes: currentCharacter)
				ifTrue: [ ^ self scan10 ].
			('Uu' includes: currentCharacter)
				ifTrue: [ ^ self scan11 ].
			('Xx' includes: currentCharacter)
				ifTrue: [ 
					self step.
					currentCharacter isHexDigit
						ifTrue: [ 
							[ 
							self recordMatch: #(155).
							self step.
							('Ll' includes: currentCharacter)
								ifTrue: [ ^ self scan10 ].
							('Uu' includes: currentCharacter)
								ifTrue: [ ^ self scan11 ].
							currentCharacter isHexDigit ] whileTrue ].
					^ self reportLastMatch ].
			('DFMdfm' includes: currentCharacter)
				ifTrue: [ ^ self recordAndReportMatch: #(156) ].
			^ self reportLastMatch ].
	currentCharacter = $:
		ifTrue: [ 
			self recordMatch: #(34).
			self step.
			currentCharacter = $:
				ifTrue: [ ^ self recordAndReportMatch: #(40) ].
			^ self reportLastMatch ].
	^ self scanSplitSeq1