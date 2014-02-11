generated
scanForToken
	state == #parser
		ifTrue: [ ^ self scan17 ].
	state == #directives
		ifTrue: [ ^ self scan14 ].
	state == #default
		ifTrue: [ ^ self scan1 ].
	state == #scanner
		ifTrue: [ ^ self scan18 ].
	^ self reportLastMatch