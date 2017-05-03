generated
scan2
	[ self step.
	currentCharacter == Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(64) ].
	currentCharacter == Character cr
		ifTrue: [ self recordMatch: #(64).
			self step.
			currentCharacter == Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(64) ].
			^ self reportLastMatch ].
	true ] whileTrue