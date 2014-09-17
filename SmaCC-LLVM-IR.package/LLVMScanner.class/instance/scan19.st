generated
scan19
	[ 
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(181) ].
	currentCharacter = Character cr
		ifTrue: [ 
			self recordMatch: #(181).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(181) ].
			^ self reportLastMatch ] ] repeat