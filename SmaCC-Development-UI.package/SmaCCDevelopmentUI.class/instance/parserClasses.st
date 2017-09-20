accessing
parserClasses
	^ ((SmaCCParser allSubclasses collect: [ :c | c name ])
		reject: [ :c | c = 'SmaCCGLRParser' ]) asSortedCollection