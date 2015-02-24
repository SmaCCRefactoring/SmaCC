generated
scanSplit34
	state == #lineBegin
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(74 75 77) ].
			currentCharacter = Character cr
				ifTrue: [ 
					self recordMatch: #(74 75 77).
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(74 75) ].
					^ self reportLastMatch ].
			currentCharacter = $#
				ifTrue: [ ^ self scan15 ].
			currentCharacter isSeparator
				ifTrue: [ 
					[ 
					self recordMatch: #(76).
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(75) ].
					currentCharacter = Character cr
						ifTrue: [ ^ self scan14 ].
					currentCharacter = $#
						ifTrue: [ ^ self scan15 ].
					currentCharacter isSeparator ] whileTrue.
					^ self reportLastMatch ].
			^ self recordAndReportMatch: #(77) ].
	state == #default
		ifTrue: [ 
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
				ifTrue: [ ^ self scan1 ].
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
				ifTrue: [ ^ self scan5 ].
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
			^ self scanSplitSeq33 ].
	^ self reportLastMatch