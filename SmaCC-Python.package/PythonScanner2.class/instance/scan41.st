generated
scan41
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(76) ].
	currentCharacter = Character cr
		ifTrue: [ 
			self recordMatch: #(76).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(76) ] ].
	^ self reportLastMatch