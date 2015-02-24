generated
scanForToken
	state == #parser
		ifTrue: [ ^ self scanSplit3 ].
	state == #directives
		ifTrue: [ ^ self scanSplit8 ].
	state == #default
		ifTrue: [ ^ self scanSplit5 ].
	state == #scanner
		ifTrue: [ 
			self step.
			currentCharacter = Character newPage
				ifTrue: [ 
					self recordMatch: #(28 41).
					self step.
					(currentCharacter isSeparator or: [ currentCharacter = Character pageUp ])
						ifTrue: [ 
							[ 
							self recordMatch: #(28).
							self step.
							currentCharacter isSeparator or: [ currentCharacter = Character pageUp ] ] whileTrue ].
					^ self reportLastMatch ].
			currentCharacter = $"
				ifTrue: [ 
					self recordMatch: #(41).
					self step.
					currentCharacter ~~ $"
						ifTrue: [ ^ self scan2 ].
					^ self reportLastMatch ].
			currentCharacter = $#
				ifTrue: [ 
					self recordMatch: #(32 41).
					self step.
					(currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ])
						ifTrue: [ 
							[ 
							self recordMatch: #(32).
							self step.
							currentCharacter <= Character tab
								or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
								whileTrue ].
					^ self reportLastMatch ].
			currentCharacter = $%
				ifTrue: [ 
					self recordMatch: #(36 41).
					self step.
					currentCharacter = $>
						ifTrue: [ ^ self recordAndReportMatch: #(9) ].
					^ self reportLastMatch ].
			currentCharacter = $'
				ifTrue: [ 
					self recordMatch: #(41).
					self step.
					(currentCharacter isLetter or: [ currentCharacter = $_ ])
						ifTrue: [ ^ self scan5 ].
					^ self reportLastMatch ].
			currentCharacter = $(
				ifTrue: [ ^ self recordAndReportMatch: #(3) ].
			currentCharacter = $)
				ifTrue: [ ^ self recordAndReportMatch: #(8 41) ].
			^ self scanSplitSeq9 ].
	^ self reportLastMatch