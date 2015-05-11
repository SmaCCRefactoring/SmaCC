generated
scanForToken
	state == #inRow
		ifTrue: [ 
			[ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(14) ].
			currentCharacter = Character cr
				ifTrue: [ 
					self recordMatch: #(14).
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(14) ].
					^ self reportLastMatch ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(13) ].
			currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue.
			true
				ifTrue: [ 
					[ 
					self step.
					currentCharacter = $|
						ifTrue: [ ^ self recordAndReportMatch: #(13) ].
					currentCharacter <= Character tab
						or: [ 
							(currentCharacter between: Character pageUp and: Character newPage)
								or: [ (currentCharacter between: (Character value: 14) and: ${) or: [ currentCharacter >= $} ] ] ] ] whileTrue ].
			^ self reportLastMatch ].
	state == #lineBegin
		ifTrue: [ ^ self scanSplit1 ].
	state == #default
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(15) ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan1 ].
			currentCharacter = $"
				ifTrue: [ ^ self scan2 ].
			currentCharacter = $`
				ifTrue: [ ^ self scan6 ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space ])
				ifTrue: [ 
					[ 
					self recordMatch: #(12).
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(15) ].
					currentCharacter = Character cr
						ifTrue: [ ^ self scan1 ].
					currentCharacter = $"
						ifTrue: [ ^ self scan2 ].
					currentCharacter = $`
						ifTrue: [ ^ self scan6 ].
					currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue ].
			true
				ifTrue: [ 
					[ 
					self recordMatch: #(12).
					self step.
					currentCharacter <= Character tab
						or: [ (currentCharacter between: Character pageUp and: Character newPage) or: [ currentCharacter >= (Character value: 14) ] ] ]
						whileTrue ] ].
	^ self reportLastMatch