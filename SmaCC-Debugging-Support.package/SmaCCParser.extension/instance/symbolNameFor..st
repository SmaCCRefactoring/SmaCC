*smacc-debugging-support
symbolNameFor: anInteger
	^ self symbolNames at: anInteger ifAbsent: [ '?' ]