generated
scan19
	[ 
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(265) ].
	currentCharacter = Character cr
		ifTrue: [ 
			self recordMatch: #(265).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(265) ].
			^ self reportLastMatch ] ] repeat