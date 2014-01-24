initialize
initialize
	super initialize.
	firstSentinel := self intervalClass
		from: 1
		to: 0
		string: ''.
	firstSentinel beSentinel.
	lastSentinel := self intervalClass
		from: 1
		to: 0
		string: ''.
	lastSentinel beSentinel.
	firstSentinel next: lastSentinel.
	currentId := 0