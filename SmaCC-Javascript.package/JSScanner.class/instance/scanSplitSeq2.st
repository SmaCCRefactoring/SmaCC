generated
scanSplitSeq2
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(45).
			self step.
			currentCharacter = $&
				ifTrue: [ ^ self recordAndReportMatch: #(66) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(73) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(27) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(4).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(60) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(6).
			self step.
			currentCharacter = $+
				ifTrue: [ ^ self recordAndReportMatch: #(33) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(68) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(21) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(7).
			self step.
			currentCharacter = $-
				ifTrue: [ ^ self recordAndReportMatch: #(30) ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(72) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(37).
			self step.
			currentCharacter isDigit
				ifTrue: [ ^ self scan9 ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(78).
			self step.
			currentCharacter = $*
				ifTrue: [ ^ self scan17 ].
			currentCharacter = $/
				ifTrue: [ 
					[ 
					self recordMatch: #(80).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue.
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ 
					self recordMatch: #(79).
					self step.
					currentCharacter = $/
						ifTrue: [ ^ self scan12 ].
					currentCharacter = $[
						ifTrue: [ ^ self scan15 ].
					currentCharacter = $\
						ifTrue: [ ^ self scan16 ].
					(currentCharacter <= Character tab
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ 
									(currentCharacter between: (Character value: 14) and: $.)
										or: [ (currentCharacter between: $0 and: $Z) or: [ currentCharacter >= $] ] ] ] ])
						ifTrue: [ ^ self scan11 ].
					^ self reportLastMatch ].
			currentCharacter = $[
				ifTrue: [ ^ self scan15 ].
			currentCharacter = $\
				ifTrue: [ ^ self scan16 ].
			(currentCharacter <= Character tab
				or: [ 
					(currentCharacter between: Character pageUp and: Character newPage)
						or: [ 
							(currentCharacter between: (Character value: 14) and: $))
								or: [ 
									(currentCharacter between: $+ and: $.)
										or: [ (currentCharacter between: $0 and: $<) or: [ (currentCharacter between: $> and: $Z) or: [ currentCharacter >= $] ] ] ] ] ] ])
				ifTrue: [ ^ self scan11 ].
			^ self reportLastMatch ].
	currentCharacter = $0
		ifTrue: [ 
			self recordMatch: #(84).
			self step.
			currentCharacter = $.
				ifTrue: [ ^ self scan9 ].
			('Ee' includes: currentCharacter)
				ifTrue: [ ^ self scan10 ].
			('Xx' includes: currentCharacter)
				ifTrue: [ 
					self step.
					currentCharacter isHexDigit
						ifTrue: [ 
							[ 
							self recordMatch: #(84).
							self step.
							currentCharacter isHexDigit ] whileTrue ] ].
			^ self reportLastMatch ].
	^ self scanSplitSeq1