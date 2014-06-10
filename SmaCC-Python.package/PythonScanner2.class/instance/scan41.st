generated
scan41
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(79) ].
	currentCharacter = Character cr
		ifTrue: [ 
			self recordMatch: #(79).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(79) ] ].
	^ self reportLastMatch