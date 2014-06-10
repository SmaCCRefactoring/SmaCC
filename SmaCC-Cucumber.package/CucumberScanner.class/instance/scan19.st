generated
scan19
	self recordMatch: #(17).
	self step.
	currentCharacter = Character lf
		ifTrue: [ ^ self scan20 ].
	currentCharacter = Character cr
		ifTrue: [ ^ self scan26 ].
	currentCharacter = $!
		ifTrue: [ 
			self recordMatch: #(17).
			self step.
			currentCharacter = Character lf
				ifTrue: [ ^ self scan21 ].
			currentCharacter = Character cr
				ifTrue: [ ^ self scan27 ].
			currentCharacter = $!
				ifTrue: [ ^ self scan18 ].
			currentCharacter = $#
				ifTrue: [ ^ self scan19 ].
			currentCharacter = $@
				ifTrue: [ ^ self scan16 ].
			currentCharacter = $|
				ifTrue: [ ^ self scan29 ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space ])
				ifTrue: [ ^ self scan14 ].
			^ self scan17 ].
	currentCharacter = $@
		ifTrue: [ ^ self scan1 ].
	currentCharacter = $|
		ifTrue: [ ^ self scan29 ].
	(currentCharacter = Character tab or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan14 ].
	^ self scan17