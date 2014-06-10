generated
scan25
	self recordMatch: #(17).
	self step.
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
				ifTrue: [ ^ self scan24 ].
			currentCharacter = $#
				ifTrue: [ ^ self scan25 ].
			currentCharacter = $@
				ifTrue: [ ^ self scan22 ].
			(currentCharacter = Character tab or: [ currentCharacter = Character space ])
				ifTrue: [ ^ self scan20 ].
			^ self scan23 ].
	((currentCharacter between: Character tab and: Character lf) or: [ currentCharacter = Character space ])
		ifTrue: [ ^ self scan20 ].
	(currentCharacter <= Character backspace
		or: [ 
			(currentCharacter between: Character pageUp and: Character newPage)
				or: [ 
					(currentCharacter between: (Character value: 14) and: Character arrowDown)
						or: [ (currentCharacter between: $" and: $?) or: [ currentCharacter >= $A ] ] ] ])
		ifTrue: [ ^ self scan23 ].
	^ self reportLastMatch