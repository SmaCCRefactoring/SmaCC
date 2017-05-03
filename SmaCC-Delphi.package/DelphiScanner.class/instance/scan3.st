generated
scan3
	self recordMatch: #(139).
	self step.
	currentCharacter == $#
		ifTrue: [ ^ self scan4 ].
	currentCharacter == $'
		ifTrue: [ ^ self scan2 ].
	currentCharacter == $^
		ifTrue: [ ^ self scan5 ].
	^ self reportLastMatch