generated
scanForToken
	state == #default
		ifTrue: [ self step.
			currentCharacter == $`
				ifTrue: [ self recordMatch: #(6).
					self step.
					currentCharacter == $`
						ifTrue: [ ^ self recordAndReportMatch: #(7) ].
					^ self reportLastMatch ].
			true
				ifTrue: [ [ self recordMatch: #(5).
					self step.
					currentCharacter ~~ $` ] whileTrue ].
			^ self reportLastMatch ].
	state == #expression
		ifTrue:
			[ ^ self scanForTokenX1 ].
	state == #code
		ifTrue: [ (self scanForString: '``')
				ifTrue: [ ^ self recordAndReportMatch: #(7) ] ].
	^ self reportLastMatch