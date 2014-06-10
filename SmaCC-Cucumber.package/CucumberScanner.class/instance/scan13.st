generated
scan13
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan33 ].
	currentCharacter = Character cr
		ifTrue: [ 
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan33 ].
			^ self reportLastMatch ].
	currentCharacter = $#
		ifTrue: [ ^ self scan15 ].
	currentCharacter = $@
		ifTrue: [ ^ self scan16 ].
	currentCharacter = $B
		ifTrue: [ ^ self scan30 ].
	currentCharacter = $S
		ifTrue: [ ^ self scan32 ].
	currentCharacter = $|
		ifTrue: [ ^ self recordAndReportMatch: #(9) ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan14 ].
	^ self scan1