generated
scanForToken
	state == #line
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(81) ].
			currentCharacter = Character cr
				ifTrue: [ 
					self recordMatch: #(81).
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(81) ].
					^ self reportLastMatch ].
			currentCharacter = $\
				ifTrue: [ 
					self step.
					currentCharacter = Character lf
						ifTrue: [ ^ self recordAndReportMatch: #(80) ].
					currentCharacter = Character cr
						ifTrue: [ 
							self recordMatch: #(80).
							self step.
							currentCharacter = Character lf
								ifTrue: [ ^ self recordAndReportMatch: #(80) ] ].
					^ self reportLastMatch ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space ])
				ifTrue: [ 
					[ 
					self recordMatch: #(80).
					self step.
					currentCharacter = Character tab or: [ currentCharacter = Character space ] ] whileTrue ].
			^ self reportLastMatch ].
	state == #default
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch