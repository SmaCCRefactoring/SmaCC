generated
scan41
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(77) ].
	currentCharacter = Character cr
		ifTrue: [ 
			self recordMatch: #(77).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(77) ] ].
	^ self reportLastMatch