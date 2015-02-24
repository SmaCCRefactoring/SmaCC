generated
scanSplit35
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
			^ self scanSplitSeq34 ].
	^ self reportLastMatch