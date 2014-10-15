generated
scanForToken
	state == #default
		ifTrue: [ ^ self scanSplit6 ].
	state == #after_keyword
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch