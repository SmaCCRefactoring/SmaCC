generated
scan12
	[ 
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(257) ].
	currentCharacter = Character cr
		ifTrue: [ 
			self recordMatch: #(257).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(257) ].
			^ self reportLastMatch ] ] repeat