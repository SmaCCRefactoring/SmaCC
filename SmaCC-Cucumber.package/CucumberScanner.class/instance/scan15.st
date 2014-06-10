generated
scan15
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan20 ].
	currentCharacter = Character cr
		ifTrue: [ ^ self scan26 ].
	currentCharacter = $!
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan21 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan27 ].
			currentCharacter = $|
				ifTrue: [ ^ self recordAndReportMatch: #(9) ].
			^ self scan1 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan14 ].
	^ self scan1