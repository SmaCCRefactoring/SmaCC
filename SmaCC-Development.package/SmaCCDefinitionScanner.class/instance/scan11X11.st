generated
scan11X11
	self recordMatch: #(39).
	self step.
	currentCharacter == $*
		ifTrue: [ ^ self scan6 ].
	^ self reportLastMatch