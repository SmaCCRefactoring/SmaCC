generated
scan66
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self recordAndReportMatch: #(74 75 77) ].
	currentCharacter = Character cr
		ifTrue: [ 
			self recordMatch: #(74 75 77).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(74 75) ].
			^ self reportLastMatch ].
	currentCharacter = $#
		ifTrue: [ ^ self scan68 ].
	currentCharacter isSeparator
		ifTrue: [ 
			[ 
			self recordMatch: #(76).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self recordAndReportMatch: #(75) ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan67 ].
			currentCharacter = $#
				ifTrue: [ ^ self scan68 ].
			currentCharacter isSeparator ] whileTrue.
			^ self reportLastMatch ].
	^ self recordAndReportMatch: #(77)