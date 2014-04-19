generated
scan65
	self recordMatch: #(75).
	self step.
	currentCharacter = Character pageUp
		ifTrue: [ ^ self scan67 ].
	(currentCharacter = Character lf or: [ currentCharacter = Character cr ])
		ifTrue: [ ^ self scan66 ].
	currentCharacter isSeparator
		ifTrue: [ 
			[ 
			self recordMatch: #(75).
			self step.
			currentCharacter = Character pageUp
				ifTrue: [ ^ self scan67 ].
			(currentCharacter = Character lf or: [ currentCharacter = Character cr ])
				ifTrue: [ ^ self scan66 ].
			currentCharacter isSeparator ] whileTrue.
			^ self reportLastMatch ].
	^ self recordAndReportMatch: #(76)