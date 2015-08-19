generated
scan1
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(80) ].
	currentCharacter = Character cr
		ifTrue: [ 
			self recordMatch: #(80).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(80) ].
			^ self reportLastMatch ].
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(42) ].
			^ self reportLastMatch ].
	currentCharacter = $"
		ifTrue: [ ^ self scan2 ].
	currentCharacter = $#
		ifTrue: [ 
			[ 
			self recordMatch: #(78).
			self step.
			currentCharacter <= Character tab
				or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
				whileTrue.
			^ self reportLastMatch ].
	currentCharacter = $%
		ifTrue: [ 
			self recordMatch: #(51).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(31) ].
			^ self reportLastMatch ].
	currentCharacter = $&
		ifTrue: [ 
			self recordMatch: #(38).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(28) ].
			^ self reportLastMatch ].
	currentCharacter = $'
		ifTrue: [ ^ self scan6 ].
	currentCharacter = $(
		ifTrue: [ ^ self recordAndReportMatch: #(81) ].
	currentCharacter = $)
		ifTrue: [ ^ self recordAndReportMatch: #(82) ].
	currentCharacter = $*
		ifTrue: [ 
			self recordMatch: #(19).
			self step.
			currentCharacter = $*
				ifTrue: [ 
					self recordMatch: #(20).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(5) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(33) ].
			^ self reportLastMatch ].
	currentCharacter = $+
		ifTrue: [ 
			self recordMatch: #(44).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(35) ].
			^ self reportLastMatch ].
	currentCharacter = $,
		ifTrue: [ ^ self recordAndReportMatch: #(22) ].
	currentCharacter = $-
		ifTrue: [ 
			self recordMatch: #(53).
			self step.
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(32) ].
			^ self reportLastMatch ].
	currentCharacter = $.
		ifTrue: [ 
			self recordMatch: #(13).
			self step.
			currentCharacter isDigit
				ifTrue: [ ^ self scan10 ].
			^ self reportLastMatch ].
	currentCharacter = $/
		ifTrue: [ 
			self recordMatch: #(50).
			self step.
			currentCharacter = $/
				ifTrue: [ 
					self recordMatch: #(48).
					self step.
					currentCharacter = $=
						ifTrue: [ ^ self recordAndReportMatch: #(6) ].
					^ self reportLastMatch ].
			currentCharacter = $=
				ifTrue: [ ^ self recordAndReportMatch: #(30) ].
			^ self reportLastMatch ].
	^ self scanSplitSeq2