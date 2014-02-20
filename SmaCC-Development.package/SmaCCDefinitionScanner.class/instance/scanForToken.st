generated
scanForToken
	state == #parser
		ifTrue: [ ^ self scan18 ].
	state == #directives
		ifTrue: [ ^ self scan15 ].
	state == #default
		ifTrue: [ ^ self scan1 ].
	state == #scanner
		ifTrue: [ ^ self scan19 ].
	^ self reportLastMatch