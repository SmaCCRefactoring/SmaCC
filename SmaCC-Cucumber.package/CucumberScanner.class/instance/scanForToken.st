generated
scanForToken
	state == #default
		ifTrue: [ ^ self scan7 ].
	state == #after_keyword
		ifTrue: [ ^ self scan1 ].
	^ self reportLastMatch