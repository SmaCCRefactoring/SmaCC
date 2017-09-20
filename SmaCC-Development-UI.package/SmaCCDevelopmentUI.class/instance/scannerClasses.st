accessing
scannerClasses
	^ (SmaCCScanner allSubclasses collect: [ :c | c name ])
		asSortedCollection