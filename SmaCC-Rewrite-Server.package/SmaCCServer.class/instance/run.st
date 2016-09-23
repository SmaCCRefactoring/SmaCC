running
run
	[ | accepted |
	accepted := socket waitForAcceptFor: 1000 ifTimedOut: [ nil ].
	accepted notNil
		ifTrue: [ self process: accepted ] ] repeat