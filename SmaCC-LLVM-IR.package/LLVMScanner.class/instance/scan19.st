generated
scan19
	[ 
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(266) ].
	currentCharacter = Character cr
		ifTrue: [ 
			self recordMatch: #(266).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(266) ].
			^ self reportLastMatch ] ] repeat